document.addEventListener('DOMContentLoaded', function () {
    // Toggle Switch
    const contenedor = document.querySelector('.contenedor')
    const toggleSwitch = document.querySelector('.switch')

    toggleSwitch.addEventListener('click', () => {
        contenedor.classList.toggle('dark-theme')
    })
})