/// @description Insert description here
// You can write your code in this editor

if(!global.pause)
{
    exit;
}

var g_width =global.view_width;
var g_height =global.view_height;

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

//하나의 매뉴의 단위
var y_buffer = 32;
var x_buffer = 16;

//시작점 
var start_y = (g_height / 2.0) - (((ds_height -1)/2.0)  *  y_buffer);
var start_x = (g_width / 2.0);

//퍼즈 메뉴 "Back" 그리기
draw_set_alpha(0.9);
draw_rectangle_color(0,0,g_width,g_height,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1);

//왼쪽 사이드 기반 그리기 
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer;
var lty;

var yy = 0;
repeat(ds_height)
{
    lty =start_y + (yy * y_buffer);
    
    if (yy= menu_option[page]) {
        draw_text_color(ltx - (x_buffer), lty, ds_grid[# 0, yy],
            c_blue,c_blue,c_blue,c_blue,0.9);
    }
    else
    {
        //draw_text(ltx, lty, ds_grid[# 0, yy]);
        draw_text_color(ltx, lty, ds_grid[# 0, yy],c_white,c_white,c_white,c_white,0.5);
    }
    

    ++yy;
}

//분할 라인 그리기 
draw_set_alpha(0.2);
draw_line(start_x, start_y - y_buffer, start_x, lty + y_buffer);
draw_set_alpha(1);

//오른쪽 사이드 기반 그리기 
draw_set_halign(fa_left);
var rtx = start_x + x_buffer;
var rty;

yy = 0;
repeat (ds_height) 
{
    rty = start_y + (yy * y_buffer);
    
    
    switch (ds_grid[# 1, yy]) {
        case menu_element_type.shift:
            var current_val = ds_grid[# 3, yy];
            var current_array = ds_grid[# 4, yy];
            var left_shift = "<< ";
            var right_shift = " >>";
            if (current_val == 0) {
                left_shift = "";
            }
            if (current_val == array_length_1d(ds_grid[# 4, yy])-1) {
                right_shift = "";
            }
            
			if ((true == inputting) && (yy == menu_option[page])) 
			{
				draw_text_color(rtx, rty, left_shift+current_array[current_val]+right_shift,
                c_yellow,c_yellow,c_yellow,c_yellow,0.5);
			}
			else
			{
				draw_text_color(rtx, rty, left_shift+current_array[current_val]+right_shift,
                c_white,c_white,c_white,c_white,0.5);
			}
            break;
        case menu_element_type.slider:
            var len = 64;
            var current_val =  ds_grid[# 3, yy];
            var current_array = ds_grid[# 4, yy];
            var circle_pos = ((current_val - current_array[0]) /
                (current_array[1] - current_array[0]));
            
            draw_set_alpha(0.2);
			if ((true == inputting) && (yy == menu_option[page])) 
			{
				draw_line_width_color(rtx,rty,rtx+len, rty,2,c_yellow,c_yellow);
				draw_circle_color(rtx + (circle_pos*len), rty, 4, c_yellow, c_yellow, false);
				draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos *100))+"%",
                c_yellow, c_yellow, c_yellow, c_yellow, 0.5);
			}
			else
			{
				draw_line_width(rtx,rty,rtx+len, rty,2);
				draw_circle_color(rtx + (circle_pos*len), rty, 4, c_white, c_white, false);
				draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos *100))+"%",
                c_white, c_white, c_white, c_white, 0.5);
			}			
            draw_set_alpha(1);
            break;
        case menu_element_type.toggle:
            var current_val = ds_grid[# 3, yy];
            var c1, c2;
            
            if(current_val == 0)
            {
				c1 = c_white;
                c2 = c_dkgray;
				if ((true == inputting) && (yy == menu_option[page])) 
				{
					c1 = c_yellow;
				}
            }
            else
            {
                c1 = c_dkgray;
                c2 = c_white;
				if ((true == inputting) && (yy == menu_option[page])) 
				{
					c2 = c_yellow;
				}
            }
            
            draw_text_color(rtx, rty, "ON", c1,c1,c1,c1,0.5);
            draw_text_color(rtx + 32, rty, "OFF",c2,c2,c2,c2,0.5);
        case menu_element_type.input:
            var current_val = ds_grid[# 3, yy];
            var stirng_val;

            switch (current_val) {
                case vk_up:
                    stirng_val = "UP_KEY";
                    break;
                case vk_down:
                    stirng_val = "DOWN_KEY";
                    break;
                case vk_left:
                    stirng_val = "LEFT_KEY";
                    break;
                case vk_right:
                    stirng_val = "RIGHT_KEY";
                    break;
                default:
                    stirng_val = chr(current_val);
                    break;
            }
			if ((true == inputting) && (yy == menu_option[page])) {
				draw_text_color(rtx, rty, stirng_val, c_yellow, c_yellow, c_yellow, c_yellow, 0.5);
			}
			else {
				draw_text_color(rtx, rty, stirng_val, c_white, c_white, c_white, c_white, 0.5);
			}
            

        default:
            break;
    }
    ++yy;
}



draw_set_valign(fa_top);






//draw_text_color(100, 50, "testmessage",c_red,c_red,c_red,c_red,1);

if (error_code != "") {
    // code here
    
    if (error_code_time > 0.0) 
    {
        // code here
        error_code_time -= delta_time / 1000000;
        draw_text_color(250, 20, error_code,c_red,c_red,c_red,c_red,1);
    }
    else
    {
        error_code = "";
        error_code_time = 0;
    }
}
