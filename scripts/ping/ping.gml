// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unix_timestamp(datetime = date_current_datetime())
{
    var epoch = floor(date_create_datetime(1970, 1, 1, 0, 0, 0));
    return floor(date_second_span(epoch, datetime));
}