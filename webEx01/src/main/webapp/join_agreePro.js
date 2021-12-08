
function checkAll(form){
	// console.log(typeof form.check[0].checked);
    form.check.forEach(element => {
        element.checked = true;
    });
    
    console.log(form.check[0].checked);
}

function checkVal(form){
    if(form.check[0].checked && form.check[1].checked){
        location.href='join_input.jsp';
    }
    else{
        const message = document.querySelector('#alert_message');
        message.append("네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.");
    }
}