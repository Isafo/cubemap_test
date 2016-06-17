#pragma once

#include <vector>

#include "GL/glew.h"

class Skybox
{
public:
	Skybox();
	~Skybox();

	void loadCubemap(std::vector<const GLchar*> faces);
	void render();
	GLuint getTextureID() const { return textureID; };


private:
	GLuint textureID;
	GLuint vao;

	int nverts; // Number of vertices in the vertex array
	GLuint vertexbuffer; // Buffer ID to bind to GL_ARRAY_BUFFER
};

