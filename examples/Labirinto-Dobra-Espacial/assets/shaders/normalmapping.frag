#version 410

in vec3 fragLEye;
in vec3 fragVEye;

in vec3 fragPObj;
in vec3 fragTObj;
in vec3 fragBObj;
in vec3 fragNObj;

in vec2 fragTexCoord;

uniform mat3 normalMatrix;

// Material properties
uniform vec4 Ka;
uniform vec4 Kd;
uniform vec4 Ks;

uniform float shininess;

// Light properties
uniform vec4 Ia;
uniform vec4 Id;
uniform vec4 Is;

// Diffuse map sampler
uniform sampler2D diffuseTex;

// Normal map sampler
uniform sampler2D normalTex;

// Mapping mode
// 0: triplanar; 1: cylindrical; 2: spherical; 3: from mesh
uniform int mappingMode;

out vec4 outColor;

// Compute matrix to transform from camera space to tangent space
mat3 ComputeTBN(vec3 TObj, vec3 BObj, vec3 NObj) {
  vec3 TEye = normalMatrix * normalize(TObj);
  vec3 BEye = normalMatrix * normalize(BObj);
  vec3 NEye = normalMatrix * normalize(NObj);
  return mat3(TEye.x, BEye.x, NEye.x, TEye.y, BEye.y, NEye.y, TEye.z, BEye.z,
              NEye.z);
}

// Blinn-Phong reflection model
// Capitulo 9 Iluminação - Blinn-Phong com sombreamento de Phong
// Ref http://professor.ufabc.edu.br/~harlen.batagelo/cg/viewer3.html#blinn-phong-com-sombreamento-de-phong
vec4 BlinnPhong(vec3 N, vec3 L, vec3 V, vec2 texCoord) {
  N = normalize(N);
  L = normalize(L);

  // Compute lambertian term
  float lambertian = max(dot(N, L), 0.0);

  // Compute specular term
  float specular = 0.0;
  if (lambertian > 0.0) {
    V = normalize(V);
    vec3 H = normalize(L + V);
    float angle = max(dot(H, N), 0.0);
    specular = pow(angle, shininess);
  }

  vec4 mKd = texture(diffuseTex, texCoord);
  vec4 diffuseColor = mKd * Kd * Id * lambertian;
  vec4 specularColor = Ks * Is * specular;
  vec4 ambientColor = mKd * Ka * Ia;

  return ambientColor + diffuseColor + specularColor;
}

// Baseado em Capitulo 10 em 10.4 Texturizacao
// Ref http://professor.ufabc.edu.br/~harlen.batagelo/cg/viewer4.html
// Planar mapping
vec2 PlanarMappingXUV(vec3 P) { return vec2(1.0 - P.z, P.y); }
mat3 PlanarMappingXTBN(vec3 P) {
  vec3 T = vec3(0, 0, -1);
  vec3 N = fragNObj;
  vec3 B = cross(N, T);
  return ComputeTBN(T, B, N);
}

vec2 PlanarMappingYUV(vec3 P) { return vec2(P.x, 1.0 - P.z); }
mat3 PlanarMappingYTBN(vec3 P) {
  vec3 T = vec3(1, 0, 0);
  vec3 N = fragNObj;
  vec3 B = cross(N, T);
  return ComputeTBN(T, B, N);
}

vec2 PlanarMappingZUV(vec3 P) { return P.xy; }
mat3 PlanarMappingZTBN(vec3 P) {
  vec3 T = vec3(1, 0, 0);
  vec3 N = fragNObj;
  vec3 B = cross(N, T);
  return ComputeTBN(T, B, N);
}

#define PI 3.14159265358979323846

// Cylindrical mapping
vec2 CylindricalUV(vec3 P) {
  float longitude = atan(P.x, P.z);
  float height = P.y;

  float u = longitude / (2.0 * PI) + 0.5;  // From [-pi, pi] to [0, 1]
  float v = height - 0.5;                  // Base at y = -0.5

  return vec2(u, v);
}

mat3 CylindricalTBN(vec3 P) {
  vec3 T = vec3(P.z, 0, -P.x);
  vec3 N = fragNObj;
  vec3 B = cross(N, T);
  return ComputeTBN(T, B, N);
}

// Spherical mapping
vec2 SphericalUV(vec3 P) {
  float longitude = atan(P.x, P.z);
  float latitude = asin(P.y / length(P));

  float u = longitude / (2.0 * PI) + 0.5;  // From [-pi, pi] to [0, 1]
  float v = latitude / PI + 0.5;           // From [-pi/2, pi/2] to [0, 1]

  return vec2(u, v);
}

mat3 SphericalTBN(vec3 P) {
  vec3 T = vec3(P.z, 0, -P.x);
  vec3 N = fragNObj;
  vec3 B = cross(N, T);
  return ComputeTBN(T, B, N);
}

// Baseado em Capitulo 10 em 10.4 Texturizacao
// Ref http://professor.ufabc.edu.br/~harlen.batagelo/cg/viewer4.html
void main() {
  vec4 color;

  if (mappingMode == 0) {
    // Triplanar mapping

    // A offset to center the texture around the origin
    vec3 offset = vec3(-0.5, -0.5, -0.5);

    // Sample with x planar mapping
    vec2 texCoord1 = PlanarMappingXUV(fragPObj + offset);
    mat3 TBN = PlanarMappingXTBN(fragPObj + offset);
    vec3 LTan = TBN * normalize(fragLEye);
    vec3 VTan = TBN * normalize(fragVEye);
    vec3 NTan = texture(normalTex, texCoord1).xyz;
    NTan = normalize(NTan * 2.0 - 1.0);  // From [0, 1] to [-1, 1]
    vec4 color1 = BlinnPhong(NTan, LTan, VTan, texCoord1);

    // Sample with y planar mapping
    vec2 texCoord2 = PlanarMappingYUV(fragPObj + offset);
    TBN = PlanarMappingYTBN(fragPObj + offset);
    LTan = TBN * normalize(fragLEye);
    VTan = TBN * normalize(fragVEye);
    NTan = texture(normalTex, texCoord2).xyz;
    NTan = normalize(NTan * 2.0 - 1.0);  // From [0, 1] to [-1, 1]
    vec4 color2 = BlinnPhong(NTan, LTan, VTan, texCoord2);

    // Sample with z planar mapping
    vec2 texCoord3 = PlanarMappingZUV(fragPObj + offset);
    TBN = PlanarMappingZTBN(fragPObj + offset);
    LTan = TBN * normalize(fragLEye);
    VTan = TBN * normalize(fragVEye);
    NTan = texture(normalTex, texCoord3).xyz;
    NTan = normalize(NTan * 2.0 - 1.0);  // From [0, 1] to [-1, 1]
    vec4 color3 = BlinnPhong(NTan, LTan, VTan, texCoord3);

    // Compute average based on normal
    vec3 weight = abs(normalize(fragNObj));
    color = color1 * weight.x + color2 * weight.y + color3 * weight.z;
  } else {
    vec2 texCoord;
    mat3 TBN;
    if (mappingMode == 1) {
      // Cylindrical mapping
      texCoord = CylindricalUV(fragPObj);
      TBN = CylindricalTBN(fragPObj);
    } else if (mappingMode == 2) {
      // Spherical mapping
      texCoord = SphericalUV(fragPObj);
      TBN = SphericalTBN(fragPObj);
    } else if (mappingMode == 3) {
      // From mesh
      texCoord = fragTexCoord;
      TBN = ComputeTBN(fragTObj, fragBObj, fragNObj);
    }

    // Compute tangent space vectors
    vec3 LTan = TBN * normalize(fragLEye);
    vec3 VTan = TBN * normalize(fragVEye);
    vec3 NTan = texture(normalTex, texCoord).xyz;
    NTan = normalize(NTan * 2.0 - 1.0);  // From [0, 1] to [-1, 1]

    color = BlinnPhong(NTan, LTan, VTan, texCoord);
  }

  outColor = color;
  
}
