#version 330
layout (location = 0) in vec3 Position;

out vec3 TexCoords;

uniform mat4 P;
uniform mat4 V;

void main()
{
    gl_Position =   P * V * vec4(Position, 1.0);  
    TexCoords = Position;
} 