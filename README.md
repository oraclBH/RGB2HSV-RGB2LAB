# RGB2HSV-RGB2LAB
LAB and HSV color modes play an important role in color image processing !

# HSV color mode  
 
HSV Color mode is a color space created by Alvy Ray Smith in 1978 based on the intuitive properties of colors.  
 
H indicates Hue. Measured by Angle, the value ranges from 0° to 360°. Starting from red, the value is 0°, green is 120°, and blue is 240°.  Their complementary colors are: yellow for 60°, cyan for 180°, purple for 300°;  
 
Saturation refers to the degree to which colors approximate spectral colors. A color that can be seen as the result of a certain spectral color mixed with white.  
The larger the proportion of spectral color, the higher the degree of color close to spectral color, the higher the saturation of color.  High saturation, deep and bright color. The white component of spectral color is 0 and the saturation is the highest. The value ranges from 0% to 100%. A larger value indicates a more saturated color.  
 
Value refers to the brightness of the color. For the color of the light source, the Value is related to the brightness of the illuminator.  For object color, 
this value is related to the transmittance or reflectance of the object.  The value usually ranges from 0% (black) to 100% (white).  
![image](https://github.com/oraclBH/RGB2HSV-RGB2LAB/blob/main/Screenshots/HSV.png)


# LAB color mode  

Lab color mode, consisting of a brightness channel and two color component channels.  
 
Lab is composed of three elements, one is brightness (L), the L component is used to represent the brightness of pixels, the value range is [0,100], representing from pure black to pure white;  
 
A and B are two color channels.  A includes colors ranging from dark green (low brightness value) to gray (medium brightness value) to bright pink (high brightness value), ranging from [127, -128];  
 
B ranges from bright blue (low brightness value) to gray (medium brightness value) to yellow (high brightness value) in the range of [127, -128].  

![image](https://github.com/oraclBH/RGB2HSV-RGB2LAB/blob/main/Screenshots/lab.png)
