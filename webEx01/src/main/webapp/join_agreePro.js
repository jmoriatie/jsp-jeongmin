
// 타이틀 누르면 링크이동
document.querySelector('#title').addEventListener('click', e=>{
    location.href = 'login.jsp';
});

function checkAll(form){    
    // check_all이 켜지면 다켜지고, 끄면 다꺼지고
    if(form.check_all.checked === true){
        form.check.forEach(element => {
            element.checked = true;
        });
    }
    else{
        form.check.forEach(element => {
            element.checked = false;
        });
    }
}

function checkVal(form){
    if(form.check[0].checked && form.check[1].checked){
        location.href='join_input.jsp';
    }
    else{
        const message = document.querySelector('#alert_message');
        message.innerHTML = "네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.";
    }
}