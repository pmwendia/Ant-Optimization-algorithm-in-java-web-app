function init() {
  const form = document.querySelector('form');
    const message = document.querySelector('.message');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        message.style.display = 'block';
        message.innerHTML = 'Successful registration';
        setTimeout(() => {
            window.location.href = 'index.jsp';
        }, 2000); // Redirect to login page after 1 second
    });
}

document.addEventListener('DOMContentLoaded', init);