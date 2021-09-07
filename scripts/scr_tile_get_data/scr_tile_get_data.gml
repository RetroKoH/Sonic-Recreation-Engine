function scr_tile_get_angle(t){
    var ang = ds_grid_get(col_angles,tile_get_index(t)&$FF,0);

    if tile_get_mirror(t)
        ang = scr_wrap_angle(-ang);
    
    if tile_get_flip(t)
        ang = scr_wrap_angle(-(ang - 90) + 90);

    return ang;
}

function scr_tile_get_width(t, row){
    var wid = 0;

    if tile_get_flip(t)
        wid = ds_grid_get(col_rotated,tile_get_index(t)&$FF, (~row)&(TILE_SIZE-1) );
    else
        wid = ds_grid_get(col_rotated,tile_get_index(t)&$FF, row&(TILE_SIZE-1) );        

    if tile_get_mirror(t) wid = -wid;
    
    return wid;
}

function scr_tile_get_height(t, col){
    var hgt = 0;

    if tile_get_mirror(t)
        hgt = ds_grid_get(col_normal,tile_get_index(t)&$FF, (~col)&(TILE_SIZE-1) );
    else
        hgt = ds_grid_get(col_normal,tile_get_index(t)&$FF, col&(TILE_SIZE-1) );        

    if tile_get_flip(t) hgt = -hgt;
    
    return hgt;
}