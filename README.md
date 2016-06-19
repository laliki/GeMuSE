# GeMuSe
Geometric Multi-parameter Space Exploration

This repository contains a Processing implementation for GeMuSE a Geometric interface for perceptual Multi-parameter Space Exploration.

GeMuSE was designed to perform perceptual exploration of algorithmic composition systems' parameter spaces. By parameter space, we refer to the set of all possible parameter combinations of a system. GeMuSE provides a complete visual representation of those combinations by using polygons. For this, the values of the n parameters are mapped (from min to max) into the n lines that joint the center with the vertexes of the n-polygon. Therefore, each parameter combination defines a different polygon in the space. Those combinations can be assigned to perceptual classes (this implementation permits the use of 4 classes).

GeMuSE was conceived to provide an interface for the sampling process of a wider methodology for algorithmic composition systems' parameter spaces aesthetic exploration. Such methodology is based on the “exploring-parameters” algorithm (implemented in SuperCollider by Iván Paz and Julian Rohrhuber https://github.com/musikinformatik/exploring-parameters), which considers parameter sets together with a perceptual user evaluation as input/output relations. Then, such relations are processed, iteratively searching for regularities and thereby compressing the data to extract human readable and interpretable (if-then) rules able to represent musical entities of low and high-level.

In this implementation, the interface send and receive OSC messages to communicate with other programs.
The interface has two operating modes:
1) Exploring mode. It allow the user for explore the space and create 4 different type of classes.
The data send has the format:  [ /data, valueParameter1, valueParameter2, . . . valueParameterN, classification ]
2) Drawing mode. The drawing mode visualizes incoming data in the format: [ valueParameter1, valueParameter2, . . . valueParameterN, classification ]

Use M key to change between the modes and keys 1, 2, 3 and 4 to assign the classes.





