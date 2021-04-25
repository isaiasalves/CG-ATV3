// OK

#ifndef OPENGLWINDOW_HPP_
#define OPENGLWINDOW_HPP_

#include <string_view>
#include <imgui.h>

#include "abcg.hpp"
#include "model.hpp"
#include "trackball.hpp"
#include "camera.hpp"

class OpenGLWindow : public abcg::OpenGLWindow {
 protected:
 
  void handleEvent(SDL_Event& ev) override;
  void initializeGL() override;
  void paintGL() override;
  void paintUI() override;
  void resizeGL(int width, int height) override;
  void terminateGL() override;

 private:

  GLuint program{};

  // Parte mencionada no coapitulo 10
  void initializeSkybox();
  void renderSkybox();
  void terminateSkybox();
  void update();

  int m_viewportWidth{};
  int m_viewportHeight{};
  float m_dollySpeed{0.0f};
  float m_truckSpeed{0.0f};
  float m_panSpeed{0.0f};
  float m_zoom{};
  int m_trianglesToDraw{};
  // Mapping mode
  // 0: triplanar; 1: cylindrical; 2: spherical; 3: from mesh
  int m_mappingMode{};
  
  abcg::ElapsedTimer m_elapsedTimer{};
  Camera m_camera;
  Model m_model;

  // Atributos de classe que servem para as instancias de Trackball
  // Vista em capitulo 8 trackball virtual
  TrackBall m_cameraLum;
  TrackBall m_trackBall;
  TrackBall m_trackBallLum;

  // Baseado em openglwindow.hpp de capitulo 8 em 8.4
  glm::mat4 m_modelMatrix{1.0f};
  glm::mat4 m_viewMatrix{1.0f};
  glm::mat4 m_projMatrix{1.0f};

  ImFont* m_font{}; // Used to load new font to ImGui

  /* Baseado em http://professor.ufabc.edu.br/~harlen.batagelo/cg/viewer3.html */
  // Light properties
  glm::vec4 m_lightDir{-1.0f, -1.0f, -1.0f, 0.0f};
  glm::vec4 m_Ia{1.0f} , m_Id{1.0f}, m_Is{1.0f};

  // Material properties
  glm::vec4 m_Ka{}, m_Kd{}, m_Ks{};
  float m_shininess{};

  // Parte mencionada na aula 10 em 10.6 Renderizando um skybox
  // Skybox
  const std::string m_skyShaderName{"skybox"};
  GLuint m_skyVAO{};
  GLuint m_skyVBO{};
  GLuint m_skyProgram{};

  // Parte mencionada na aula 10 em 10.6 Renderizando um skybox
  // clang-format off
  const std::array<glm::vec3, 36>  m_skyPositions{
    // Front
    glm::vec3{-1, -1, +1}, glm::vec3{+1, -1, +1}, glm::vec3{+1, +1, +1},
    glm::vec3{-1, -1, +1}, glm::vec3{+1, +1, +1}, glm::vec3{-1, +1, +1},
    // Back
    glm::vec3{+1, -1, -1}, glm::vec3{-1, -1, -1}, glm::vec3{-1, +1, -1},
    glm::vec3{+1, -1, -1}, glm::vec3{-1, +1, -1}, glm::vec3{+1, +1, -1},
    // Right
    glm::vec3{+1, -1, -1}, glm::vec3{+1, +1, -1}, glm::vec3{+1, +1, +1},
    glm::vec3{+1, -1, -1}, glm::vec3{+1, +1, +1}, glm::vec3{+1, -1, +1},
    // Left
    glm::vec3{-1, -1, +1}, glm::vec3{-1, +1, +1}, glm::vec3{-1, +1, -1},
    glm::vec3{-1, -1, +1}, glm::vec3{-1, +1, -1}, glm::vec3{-1, -1, -1},
    // Top
    glm::vec3{-1, +1, +1}, glm::vec3{+1, +1, +1}, glm::vec3{+1, +1, -1},
    glm::vec3{-1, +1, +1}, glm::vec3{+1, +1, -1}, glm::vec3{-1, +1, -1},
    // Bottom
    glm::vec3{-1, -1, -1}, glm::vec3{+1, -1, -1}, glm::vec3{+1, -1, +1},
    glm::vec3{-1, -1, -1}, glm::vec3{+1, -1, +1}, glm::vec3{-1, -1, +1}
  };
};

#endif