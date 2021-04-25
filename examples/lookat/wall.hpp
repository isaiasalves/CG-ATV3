#ifndef WALL_HPP_
#define WALL_HPP_

#include "abcg.hpp"
#include "openglwindow.hpp"

class Wall {
 public:

  void loadModelFromFile(std::string_view path, float offset, float scale = 1.0f);

  std::vector<Vertex> m_vertices;
  std::vector<GLuint> m_indices;

  [[nodiscard]] int getNumTriangles() const {
    return static_cast<int>(m_indices.size()) / 3;
  }

  void paintGL();
  void initializeGL(GLuint program);

 private:
  float m_yoffset;
  float m_scale { 1.0f };

  GLuint m_VAO{};
  GLuint m_VBO{};
  GLuint m_EBO{};
  GLuint m_program{};

  glm::vec4 m_Ka;
  glm::vec4 m_Kd;
  glm::vec4 m_Ks;
  float m_shininess;
  GLuint m_diffuseTexture{};
  GLuint m_normalTexture{};

  bool m_hasNormals{false};
  bool m_hasTexCoords{false};

  glm::vec4 color { 58/255.0f, 95/255.0f, 11/255.0f, 1.0f};

  void standardize();

  void loadDiffuseTexture(std::string_view path);
  void loadNormalTexture(std::string_view path);

  void computeNormals();
  void computeTangents();
  
};

#endif