const form = document.getElementById('form');
const username = document.getElementById('uname');
const email = document.getElementById('uemail');
const password = document.getElementById('upass');
const check = document.getElementById('check');



const isValidEmail = email => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
};

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
};

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    errorDisplay.innerText = '';
    inputControl.classList.remove('error');
    inputControl.classList.add('success');
};


const validateInputs = () => {
    const usernameValue = username.value.trim();
    const emailValue = email.value.trim();
    const passwordValue = password.value.trim();

    if (usernameValue === '') {
        setError(username, 'Username is required');
        return false;
    } else {
        setSuccess(username);
    }

    if (emailValue === '') {
        setError(email, 'Email is required');
        return false;
    } else if (!isValidEmail(emailValue)) {
        setError(email, 'Provide a valid email address');
        return false;
    } else {
        setSuccess(email);
    }

    if (passwordValue === '') {
        setError(password, 'Password is Required');
        return false;
    } else if (passwordValue.length < 8) {
        setError(password, 'Password length must be at least 8 characters');
        return false;
    } else {
        setSuccess(password);
    }

    if (!check.checked) {
        setError(check, 'Please agree to the terms and conditions');
        return false;
    } else {
        setSuccess(check);
    }

    return true; // All validations passed
};


form.addEventListener('submit', ev => {
    if (!validateInputs()) {
        ev.preventDefault(); // Prevent default form submission if validation fails
    }
});
