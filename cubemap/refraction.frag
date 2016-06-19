#version 330 core

uniform vec3 camPos;
uniform samplerCube environmentMap;

in vec3 interpolatedNormal;
in vec3 pos;

out vec4 color;

void main() {
    //air / water
    //float ratio = 1.0 / 1.33;
    // air / glass
    float ratio = 1.0 / 1.52;

    vec3 viewDir = (pos - camPos);
    vec3 R = refract(viewDir, normalize(interpolatedNormal), ratio);
	color  = vec4(texture(environmentMap, R).rgb, 1.0);
}

