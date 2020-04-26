/// @description Insert description here

/// @arg ["Name1", Type1, Entries1 ...]
/// @arg ["Name2", Type2, Entries2 ...]
//인자 ["이름1", 타입1, 진입점1 ...]
//인자 ["이름2", 타입2, 진입점2 ...]

var arg, tempCount = 0;


//arg에 받은 명령행 채우기
repeat(argument_count)
{
    arg[tempCount] = argument[tempCount];
    ++tempCount;
}

//for(var i ; i <= argument_count; ++i) 
//{ arg[i] = argument[i]; }

//그리드 생성
var ds_grid_id = ds_grid_create(5,argument_count);

//그리드에 넣어주기
tempCount = 0;
repeat(argument_count)
{
    var array = arg[tempCount];
    var array_len = array_length_1d(array);
    
    var xx = 0; 
    
    repeat(array_len)
    {
        // [# ] -> 접근 엑세스 (그리드)
        // [# ] 검색 참고 
        ds_grid_id[# xx, tempCount] = array[xx];
        ++xx;
    }
    
    ++tempCount;
}


return ds_grid_id;

