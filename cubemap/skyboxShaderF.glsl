#version 330

in vec3 TexCoords;

out vec4 color;

uniform samplerCube skyboxTex;

void main()
{    
    color = texture(skyboxTex, TexCoords);
}
  