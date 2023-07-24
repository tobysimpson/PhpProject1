function fn_focus(ele)
{
    console.log('focus');
    
    //read
    res_id   = document.getElementById("res_id").value;
    col_id   = ele.getAttribute('col_id');
    col_name = ele.getAttribute('col_name');
    
    console.log(res_id);
    
    //store
    ele.setAttribute('value_old', ele.getAttribute('value'));
    
    console.log(ele.getAttribute('value_old'));
    
    fn_get('col.php?mth=disp&res_id='+res_id+'&col_name='+col_name, document.getElementById("disp"));
}

function fn_change(ele)
{
    console.log('change');
    
    console.log(ele.value);
    console.log(ele.getAttribute('value_old'));
    
    res_id = document.getElementById("res_id").value;
    n      = document.getElementById("n").value;
    col_id = ele.getAttribute('col_id');
    v0     = ele.getAttribute('value_old');
    v1     = ele.value;
    
    window.location.href = 'evt.php?mth=upsert&res_id='+res_id+'&col_id='+col_id+'&n='+n+'&v1='+(v1-v0);
    
}