// Espera a que el DOM cargue
document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("form");

  if (form) {
    form.addEventListener("submit", function (event) {
      event.preventDefault(); // Evita el envío real (hasta que conecten backend)

      // Obtiene los valores
      const nombre = document.getElementById("nombre").value.trim();
      const email = document.getElementById("email").value.trim();
      const asunto = document.getElementById("asunto").value.trim();
      const mensaje = document.getElementById("mensaje").value.trim();

      // Validación simple
      if (!nombre || !email || !asunto || !mensaje) {
        alert("Por favor, completá todos los campos.");
        return;
      }

      if (!validarEmail(email)) {
        alert("Por favor, ingresá un correo electrónico válido.");
        return;
      }

      // Simulación de envío correcto
      alert("¡Gracias por tu mensaje! Te responderemos a la brevedad.");
      form.reset();
    });
  }
});

// Función para validar correo
function validarEmail(email) {
  const re = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
  return re.test(email.toLowerCase());
}
