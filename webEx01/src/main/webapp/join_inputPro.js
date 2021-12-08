// 인증번호 관련 변수 생략
// const self_check_message = document.querySelector('#self_check_message');

// 타이틀 누르면 링크이동
document.querySelector('#title').addEventListener('click', e=>{
    location.href = 'login.jsp';
});

function validateAll(){
    let cnt = 0;
    // 7개
    if(id_validate()) cnt++;
    if(pw_validate()) cnt++;
    if(pw_check_validate()) cnt++;
    if(name_validate()) cnt++;
    if(birth_validate()) cnt++;
    if(gender_validate()) cnt++;
    // if(email_validate()) cnt++;
    console.log('email: ',email);
    if(tel_validate()) cnt++;

    if(cnt === 7){
        // 다 true 나오면, 데이터 다 담아서 어디론가 이동
        // location.href = '';
        alert('가입완료!');
    }
    else{
        alert('문제있음, 확인바람');
    }
};

function id_validate(){
    const id = document.querySelector('#id').value;
    const id_message = document.querySelector('#id_message');
    console.log('id: ',id);

    if(id === ''){
        id_message.innerHTML = '아이디를 입력하세요';
        return false;
    }else{
        id_message.innerHTML = '';
        return true;
    }
}

function pw_validate(){
    const pw = document.querySelector('#pw').value;
    const pw_message = document.querySelector('#pw_message');
    console.log('pw: ',pw);

    if(pw === ''){
        pw_message.innerHTML = '비밀번호를 입력하세요';
        return false;
    }else{
        pw_message.innerHTML = '';
        return true;
    }
}

function pw_check_validate(){
    const pw_check = document.querySelector('#pw_check').value;
    const pw = document.querySelector('#pw').value;
    const pw_check_message = document.querySelector('#pw_check_message');
    console.log('pw_check: ', pw_check);

    if(pw.valueOf() !== pw_check.valueOf()){
        pw_check_message.innerHTML = '비밀번호가 일치하지 않습니다';
        return false;
    }
    else{
        pw_check_message.innerHTML = '';
        return true;
    }
}

function name_validate(){
    const name = document.querySelector('#name').value;
    const name_message = document.querySelector('#name_message');
    console.log('name: ',name);

    if(name === ''){
        name_message.innerHTML = '이름을 입력해주세요';
        return false;
    }else{
        name_message.innerHTML = '';
        return true;
    }
}

function birth_validate(){
    const year = document.querySelector('#year').value;
    const month = document.querySelector('#month').value;
    const day = document.querySelector('#day').value;
    const birth_message = document.querySelector('#birth_message');

    const year_parse = parseInt(year);
    const month_parse = parseInt(month);
    const day_parse = parseInt(day);

    // console.log('year_parse: ', year_parse);
    // parseInt는 NaN을 반환하며, isNaN()으로 확인 가능
    // console.log('isNaN: ', isNaN(year_parse)); 
    console.log('birth: ', year , month, day);
    
    const yearTest = /^(19[0-9][0-9]|20\d{2})$/;
    const dayTest = /^([1-9]|[1-2][0-9]|3[0-1])$/;
    if(isNaN(year_parse) || !yearTest.test(year)){
        console.log(yearTest.test(year_parse));
        birth_message.innerHTML = '년도를 올바로 입력해주세요';
        return false;
    }
    else if(month_parse === null){
        birth_message.innerHTML = '월을 입력해주세요';
        return false;
    }
    else if(isNaN(day_parse) || !dayTest.test(day_parse)){
        birth_message.innerHTML = '일을 올바로 입력해주세요';
        return false;
    }
    else{
        birth_message.innerHTML = '';
        return true;
    }
}

function gender_validate(){
    const gender = document.querySelector('#gender').value;
    const gender_message = document.querySelector('#gender_message');


    if(gender === ''){
        gender_message.innerHTML = '성별을 선택해주세요';

        return false;
    }else{
        gender_message.innerHTML = '';
        return true;
    }
}

// 이메일 선택 작성 => 생략
// function email_validate(){
//    const email = document.querySelector('#email').value;
//    const email_message = document.querySelector('#email_message');
//
//     if(email === ''){
//         email_message.innerHTML = '이메일을 입력해주세요';
//         return false;
//     }
//     return true
// }

function tel_validate(){
    // const tel_country = document.querySelector('#tel_country').value;
    const tel = document.querySelector('#tel').value;
    const tel_message = document.querySelector('#tel_message');
    
    const tel_parse = parseInt(tel);

    console.log('tel: ',tel);
    console.log('tel_message_parse: ',tel_parse);
    
    const telTest = /^1([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
    if(isNaN(tel_parse) || !telTest.test(tel_parse)){
        tel_message.innerHTML = '전화번호를 확인하세요';
        return false;
    }else{
        tel_message.innerHTML = '';
        return true;
    }
}