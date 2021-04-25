/* Baseado no capitulo 8 (trackball) e capitulo 10 de texturas*/
// OK

#ifndef MODEL_HPP_
#define MODEL_HPP_

#include <string_view>

#include "abcg.hpp"

// structure baseada em capitulo 10 em 10.5 http://professor.ufabc.edu.br/~harlen.batagelo/cg/normalmapping.html
struct Vertex {
  glm::vec3 position{};
  glm::vec3 normal{};
  glm::vec2 texCoord{};
  glm::vec4 tangent{};

  bool operator==(const Vertex& other) const noexcept {
    static const auto epsilon{std::numeric_limits<float>::epsilon()};
    return glm::all(glm::epsilonEqual(position, other.position, epsilon)) &&
           glm::all(glm::epsilonEqual(normal, other.normal, epsilon)) &&
           glm::all(glm::epsilonEqual(texCoord, other.texCoord, epsilon));
  }
};

// Baseado em model.hpp em http://professor.ufabc.edu.br/~harlen.batagelo/cg/viewer1.html
// Coapitulo 8 em 8.4 model.hpp
class Model {
 public:
 
  Model() = default;
  virtual ~Model();

  Model(const Model&) = delete;
  Model(Model&&) = default;
  Model& operator=(const Model&) = delete;
  Model& operator=(Model&&) = default;

  [[nodiscard]] int getNumTriangles() const {
    return static_cast<int>(m_indices.size()) / 3;
  }

  // Referencia capitulo 10 em 10.4 - Gerando texturas
  // http://professor.ufabc.edu.br/~harlen.batagelo/cg/viewer4.html 
  void loadDiffuseTexture(std::string_view path);
  void loadNormalTexture(std::string_view path);
  void loadFromFile(std::string_view path, bool standardize = true);

  // Referencia capitulo 10 em 10.6 - Carregando o mapa de textura cúbico
  // http://professor.ufabc.edu.br/~harlen.batagelo/cg/envmapping.html 
  void loadCubeTexture(const std::string& path);

  void render(int numTriangles = -1) const;
  void setupVAO(GLuint program);

  // Propriedades de Textura do ambiente
  [[nodiscard]] GLuint getCubeTexture() const { return m_cubeTexture; }
  
  // Propriedades de Textura dos modelos 
  [[nodiscard]] glm::vec4 getKa() const { return m_Ka; }
  [[nodiscard]] glm::vec4 getKd() const { return m_Kd; }
  [[nodiscard]] glm::vec4 getKs() const { return m_Ks; }

  [[nodiscard]] float getShininess() const { return m_shininess; }
  [[nodiscard]] bool isUVMapped() const { return m_hasTexCoords; }

 // Baseado em model.hpp de http://professor.ufabc.edu.br/~harlen.batagelo/cg/viewer1.html
 // Capitulo 8 em 8.4 Visualizador 3d
 private:

  GLuint m_VAO{};
  GLuint m_VBO{};
  GLuint m_EBO{};

  GLuint m_diffuseTexture{};
  GLuint m_normalTexture{};
  GLuint m_cubeTexture{};

  std::vector<Vertex> m_vertices;
  std::vector<GLuint> m_indices;

  void computeNormals();
  void computeTangents();
  void createBuffers();
  void standardize();

  // Propriedades de Textura dos modelos 
  glm::vec4 m_Ka;
  glm::vec4 m_Kd;
  glm::vec4 m_Ks;
  
  float m_shininess;

  bool m_hasNormals{false};
  bool m_hasTexCoords{false};

};

#endif