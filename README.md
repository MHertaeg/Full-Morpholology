# Full-Morpholology
Custom Matlab function used to analyse liquid penetration into porous media. Determines the level of infiltration at specified capillary pressures. Algorith based on technique first developed by Hazlett (1995). 

## Summary of Full Morphology Analysis
Full morphology (FM) analysis is a quasi-static gemometric method for characterising the saturation in a porous media at different values of capillary pressure. The method requires an image of the sample under investigation. The FM algorith fits spheres of constant size into the void spaces in the media. The radius of these spheres is calculated from a predetermined capillary pressure with the Young-Laplace equation. The positions of these spheres represents the non-wetting phase and the remaining void space not occupied by spheres represent the wetting phase. This operation can be completed with different sized spheres corresponding to different capillary pressures. For a full description of analysis technique see Masooni et al. (2012). 

## Code Walkthrough
The first step is completed in the function *** where every voxel in the void space is assigned a number that corresponds to the distance to the closest solid phase voxel. The output of this step is saved as *** and is passed onto the *** function which fills the void space will spheres of the specified radius. The output of this function is saved as ***, this is a 3D matlab matrix with values that vary from 0-2 depending on the phase ocupying that voxel. 0 - non wetting phase, 1 - wetting phase and 2 solid phase.
## References

Hazlett, R. D. Transport in Porous Media 1995, 20, 21–35. 

Masoodi, Reza, and Krishna M. Pillai, eds. Wicking in porous materials: traditional and modern modeling approaches. CRC Press, 2012 p 136-140.
