// OK

#include "openglwindow.hpp"

#include <imgui.h>

#include <cppitertools/itertools.hpp>
#include <glm/ext/vector_int2.hpp>
#include <glm/gtc/matrix_inverse.hpp>

//Comandos baseados na aula 7. Capítulo 7.7 (LookAt na prática)
void OpenGLWindow::handleEvent(SDL_Event& ev) {
  if (ev.type == SDL_KEYDOWN) {
    if (ev.key.keysym.sym == SDLK_UP || ev.key.keysym.sym == SDLK_w)
      m_dollySpeed = 1.0f;
    if (ev.key.keysym.sym == SDLK_DOWN || ev.key.keysym.sym == SDLK_s)
      m_dollySpeed = -1.0f;
    if (ev.key.keysym.sym == SDLK_LEFT || ev.key.keysym.sym == SDLK_a)
      m_panSpeed = -1.0f;
    if (ev.key.keysym.sym == SDLK_RIGHT || ev.key.keysym.sym == SDLK_d)
      m_panSpeed = 1.0f;
    if (ev.key.keysym.sym == SDLK_q) m_truckSpeed = -1.0f;
    if (ev.key.keysym.sym == SDLK_e) m_truckSpeed = 1.0f;
  }
  if (ev.type == SDL_KEYUP) {
    if ((ev.key.keysym.sym == SDLK_UP || ev.key.keysym.sym == SDLK_w) &&
        m_dollySpeed > 0)
      m_dollySpeed = 0.0f;
    if ((ev.key.keysym.sym == SDLK_DOWN || ev.key.keysym.sym == SDLK_s) &&
        m_dollySpeed < 0)
      m_dollySpeed = 0.0f;
    if ((ev.key.keysym.sym == SDLK_LEFT || ev.key.keysym.sym == SDLK_a) &&
        m_panSpeed < 0)
      m_panSpeed = 0.0f;
    if ((ev.key.keysym.sym == SDLK_RIGHT || ev.key.keysym.sym == SDLK_d) &&
        m_panSpeed > 0)
      m_panSpeed = 0.0f;
    if (ev.key.keysym.sym == SDLK_q && m_truckSpeed < 0) m_truckSpeed = 0.0f;
    if (ev.key.keysym.sym == SDLK_e && m_truckSpeed > 0) m_truckSpeed = 0.0f;
  }
}

void OpenGLWindow::initializeGL() {

  /* Baseado no capitulo 8 em 8.4 Visualizador 3d e capitulo 6 em lendo um modelo 3d*/

  // Colors
  glClearColor(0, 0, 0, 1);

  // Enable depth buffering
  glEnable(GL_DEPTH_TEST);

  // Create program
  program = createProgramFromFile(getAssetsPath() + "shaders/normalmapping.vert", getAssetsPath() + "shaders/normalmapping.frag");
  
  // Load default model
  m_model.loadFromFile(getAssetsPath() + "Maze.obj");
  m_model.setupVAO(program);
  m_trianglesToDraw = m_model.getNumTriangles();

  /* Baseado no capitulo 10 em 10.4 texturizacao na pratica*/

  // Use material properties from the loaded model
  m_Ka = m_model.getKa();
  m_Kd = m_model.getKd();
  m_Ks = m_model.getKs();
  m_shininess = m_model.getShininess();

  // Load cubemap
  m_model.loadCubeTexture(getAssetsPath() + "cube/");
  m_mappingMode = 3;  // "From mesh" option
  initializeSkybox();

}

// Baseado em Capitulo 10.6 - Renderizando um skybox
void OpenGLWindow::renderSkybox() {
  glUseProgram(m_skyProgram);

  // Get location of uniform variables
  GLint viewMatrixLoc{glGetUniformLocation(m_skyProgram, "viewMatrix")};
  GLint projMatrixLoc{glGetUniformLocation(m_skyProgram, "projMatrix")};
  GLint skyTexLoc{glGetUniformLocation(m_skyProgram, "skyTex")};

  // Set uniform variables
  auto viewMatrix{m_trackBallLum.getRotation()};
  glUniformMatrix4fv(viewMatrixLoc, 1, GL_FALSE, &viewMatrix[0][0]);
  glUniformMatrix4fv(projMatrixLoc, 1, GL_FALSE, &m_projMatrix[0][0]);
  glUniform1i(skyTexLoc, 0);

  glBindVertexArray(m_skyVAO);

  glActiveTexture(GL_TEXTURE0);
  glBindTexture(GL_TEXTURE_CUBE_MAP, m_model.getCubeTexture());

  glEnable(GL_CULL_FACE);
  glFrontFace(GL_CW);
  glDepthFunc(GL_LEQUAL);
  glDrawArrays(GL_TRIANGLES, 0, m_skyPositions.size());
  glDepthFunc(GL_LESS);

  glBindVertexArray(0);
  glUseProgram(0);
}

// Baseado em Capitulo 10.6 - Renderizando um skybox
void OpenGLWindow::initializeSkybox() {
  // Create skybox program
  auto path{getAssetsPath() + "shaders/skybox"};
  m_skyProgram = createProgramFromFile(path + ".vert", path + ".frag");

  // Generate VBO
  glGenBuffers(1, &m_skyVBO);
  glBindBuffer(GL_ARRAY_BUFFER, m_skyVBO);
  glBufferData(GL_ARRAY_BUFFER, sizeof(m_skyPositions), m_skyPositions.data(),
               GL_STATIC_DRAW);
  glBindBuffer(GL_ARRAY_BUFFER, 0);

  // Get location of attributes in the program
  GLint positionAttribute{glGetAttribLocation(m_skyProgram, "inPosition")};

  // Create VAO
  glGenVertexArrays(1, &m_skyVAO);

  // Bind vertex attributes to current VAO
  glBindVertexArray(m_skyVAO);

  glBindBuffer(GL_ARRAY_BUFFER, m_skyVBO);
  glEnableVertexAttribArray(positionAttribute);
  glVertexAttribPointer(positionAttribute, 3, GL_FLOAT, GL_FALSE, 0, nullptr);
  glBindBuffer(GL_ARRAY_BUFFER, 0);

  // End of binding to current VAO
  glBindVertexArray(0);
}

// Baseado em Capitulo 10.6 - Renderizando um skybox
void OpenGLWindow::terminateSkybox() {
  glDeleteProgram(m_skyProgram);
  glDeleteBuffers(1, &m_skyVBO);
  glDeleteVertexArrays(1, &m_skyVAO);
}

// 70% 
void OpenGLWindow::paintGL() {

  /* Baseado em Capitulo 7 - Matrizes e Transformacoes
     7.7 LookAt na pratica em openglwindow.cpp  
  */

  update();

  // Clear color buffer and depth buffer
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  glViewport(0, 0, m_viewportWidth, m_viewportHeight);

  // Use currently selected program
  glUseProgram(program);

  // Capitulo 10 em 10.5 Carregando a textura de normais 
  // Get location of uniform variables
  GLint viewMatrixLoc{glGetUniformLocation(program, "viewMatrix")};
  GLint modelMatrixLoc{glGetUniformLocation(program, "modelMatrix")};
  GLint projMatrixLoc{glGetUniformLocation(program, "projMatrix")};
  GLint normalMatrixLoc{glGetUniformLocation(program, "normalMatrix")};

  // Capitulo 10 em 10.5 Carregando a textura de normais 
  GLint diffuseTexLoc{glGetUniformLocation(program, "diffuseTex")};
  GLint normalTexLoc{glGetUniformLocation(program, "normalTex")};
  GLint mappingModeLoc{glGetUniformLocation(program, "mappingMode")};
  GLint cubeTexLoc{glGetUniformLocation(program, "cubeTex")};

  GLint texMatrixLoc{glGetUniformLocation(program, "texMatrix")};

   
  GLint lightDirLoc{glGetUniformLocation(program, "lightDirWorldSpace")};

   
  GLint IaLoc{glGetUniformLocation(program, "Ia")};
  GLint IdLoc{glGetUniformLocation(program, "Id")};
  GLint IsLoc{glGetUniformLocation(program, "Is")};
  GLint KaLoc{glGetUniformLocation(program, "Ka")};
  GLint KdLoc{glGetUniformLocation(program, "Kd")};
  GLint KsLoc{glGetUniformLocation(program, "Ks")};
  
   
  GLint shininessLoc{glGetUniformLocation(program, "shininess")};

  // Set uniform variables for viewMatrix and projMatrix
  // These matrices are used for every scene object
  glUniformMatrix4fv(viewMatrixLoc, 1, GL_FALSE, &m_camera.m_viewMatrix[0][0]);
  glUniformMatrix4fv(projMatrixLoc, 1, GL_FALSE, &m_camera.m_projMatrix[0][0]);
  
  // Capitulo 10 em 10.5 Carregando a textura de normais
   
  glUniform1i(diffuseTexLoc, 0);
  glUniform1i(normalTexLoc, 1);
  glUniform1i(cubeTexLoc, 2);
  glUniform1i(mappingModeLoc, m_mappingMode);

  // Trackball e iluminacao
  glm::mat3 texMatrix{m_trackBallLum.getRotation()};
  glUniformMatrix3fv(texMatrixLoc, 1, GL_TRUE, &texMatrix[0][0]);
  
  // Direcao da iluminacao
  auto lightDirRotated{m_cameraLum.getRotation() * m_lightDir};
  glUniform4fv(lightDirLoc, 1, &lightDirRotated.x);
  glUniform4fv(IaLoc, 1, &m_Ia.x);
  glUniform4fv(IdLoc, 1, &m_Id.x);
  glUniform4fv(IsLoc, 1, &m_Is.x);

   
  glUniform1f(shininessLoc, m_shininess);
  glUniform4fv(KaLoc, 1, &m_Ka.x);
  glUniform4fv(KdLoc, 1, &m_Kd.x);
  glUniform4fv(KsLoc, 1, &m_Ks.x);

  // Capitulo 6 em 6.4 Orientacao e face culling 
  glFrontFace(GL_CCW);

  // Set uniform variables of the current object
  glUniformMatrix4fv(modelMatrixLoc, 1, GL_FALSE, &m_modelMatrix[0][0]);

  auto modelViewMatrix{glm::mat3(m_viewMatrix * m_modelMatrix)};
  glm::mat3 normalMatrix{glm::inverseTranspose(modelViewMatrix)};
  glUniformMatrix3fv(normalMatrixLoc, 1, GL_FALSE, &normalMatrix[0][0]);

   
  m_model.render(m_trianglesToDraw);

  // Capitulo 10 em 10.6 mapeamento de ambiente na pratica
  renderSkybox();

   
  glUseProgram(0);

  auto aspect{static_cast<float>(m_viewportWidth) / static_cast<float>(m_viewportHeight)};
  m_projMatrix = glm::perspective(glm::radians(45.0f), aspect, 0.1f, 5.0f);

}

//Informações no HUD
void OpenGLWindow::paintUI(){
  ImGui::SetNextWindowPos(ImVec2{0, 0});
  ImGui::SetNextWindowSize(ImVec2{(float)300, (float)150});
  ImGuiWindowFlags flags{ImGuiWindowFlags_NoBackground |
                          ImGuiWindowFlags_NoTitleBar};
  
  ImGui::Begin("OpenGL Texture Text", nullptr, flags);
    
  if (m_elapsedTimer.elapsed() < 10) {
    ImGui::Text("...This is Major Tom to Ground Control");
    ImGui::Text("I'm stepping through the door ... ");
    ImGui::Text("...of something like a...  ");
    ImGui::Text("...Labyrinth!!  ");
    ImGui::Spacing();
    ImGui::Spacing();
    ImGui::Spacing();
  }
  ImGui::End();
}

// OK
void OpenGLWindow::resizeGL(int width, int height) {

  // Capitulo 8.4 - visualizador 3d em openglwindow.cpp  
  m_viewportWidth = width;
  m_viewportHeight = height;

  // Capitulo 8.4 - visualizador 3d em openglwindow.cpp 
  m_trackBall.resizeViewport(width, height);

  // Capitulo 8.4 - visualizador 3d em openglwindow.cpp 
  // e Capitulo 9 - sessao 9.6
  m_trackBallLum.resizeViewport(width, height);
  m_camera.computeProjectionMatrix(width, height);
}

// OK
void OpenGLWindow::terminateGL() {
  // Capitulo 8.4 - visualizador 3d em openglwindow.cpp 
  glDeleteProgram(program);
  // Capitilo 10 - 10.6 Mapeamento de ambiente
  terminateSkybox();
}

// OK
void OpenGLWindow::update() {

  // Capitulo 7 LookAt Na Pratica project - openglwindow.cpp
  // Update LookAt camera
  float deltaTime{static_cast<float>(getDeltaTime())};
  m_camera.dolly(m_dollySpeed * deltaTime);  
  m_camera.truck(m_truckSpeed * deltaTime);
  m_camera.pan(m_panSpeed * deltaTime);

  // Visualizador 3D - Capitulo 7 openglwindow.cpp
  m_modelMatrix = m_trackBall.getRotation();

  // Visualizador 3D - Capitulo 7 openglwindow.cpp 
  m_viewMatrix = glm::lookAt(glm::vec3(0.0f, 0.0f, 2.0f + m_zoom),
                 glm::vec3(0.0f, 0.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f));
 
}