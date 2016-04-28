

function [x,y,z] = sphericalToCartesian (phi, lambda, h)
    r = 6378137;
    x = (r+h)*cos(phi)*cos(lambda)
    y = (r+h)*cos(phi)*sin(lambda)
    z = (r+h)*sin(phi)