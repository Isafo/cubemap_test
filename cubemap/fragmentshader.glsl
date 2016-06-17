#version 330 core

uniform float time;
uniform sampler2D depthTex;

in vec3 interpolatedNormal;
in vec2 st;
in vec3 pos;

out vec4 color;

vec4 lightPos = vec4(0.0f, 1.0f, -1.0f, 1.0f);


void main() {

	vec3 LightIntensity = vec3(0.6f, 0.6f, 0.6f);

	vec3 Kd = vec3(0.7f, 0.7f, 0.7f);                // Diffuse reflectivity
	vec3 Ka = vec3(0.1f, 0.1f, 0.1f);                // Ambient reflectivity
	vec3 Ks = vec3( 0.2f, 0.2f, 0.2f);				 // Specular reflectivity
	float Shininess = 6.0f;							 // Specular shininess factor
	vec3 norm = normalize( interpolatedNormal );			
	vec3 vie = normalize(vec3(-pos));				 // viewDir	
		
	float strength = 0.8f;

	//float distance0 = length( vec3(lPos) - pos);
	
	// 0th
	vec3 s = normalize( vec3(lightPos) - pos );			 // lightDir
	vec3 r = reflect( -s, norm );						 // reflectDir

	vec3 LI = LightIntensity * (  Ka + Kd * max( dot(s, norm), 0.0 ))
			  + Ks * pow( max( dot(r,vie), 0.0 ), Shininess ) * strength;

	color  = vec4(LI, 1.0);

	 /*vec4 texcolor = vec4(1.0, 1.0, 1.0, 1.0);
     vec3 nNormal = normalize(interpolatedNormal);
     float diffuse = max(0.0, nNormal.z);
     color = texcolor * occlusion;*/
	 //color = texcolor * diffuse;
}

