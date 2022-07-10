# Admin user, clearly not meant for production use
User.create(first_name: 'Administrador', last_name: 'D', email: 'admin@uc.cl', password: 'admin123', admin: true)

# Fake user for testing
User.create(first_name: 'Javier', last_name: 'Gonzalez', email: 'jgonzalez@uc.cl', password: 'javier123', points: 61)
User.create(first_name: 'Julio', last_name: 'Casas', email: 'julio.casas@uc.cl', password: 'ñeñeñe', points: 52)
User.create(first_name: 'Javiera', last_name: 'Pinto', email: 'j.pinto@uc.cl', password: 'hola1234', points: 111)
User.create(first_name: 'María', last_name: 'Paz', email: 'm.alejandro.p@gmail.cl', password: 'perlanegra123', points: 213)
User.create(first_name: 'Sofía', last_name: 'Montenegro', email: 'sofia.montenegro@uc.cl', password: 'chiguagua', points: 6)
User.create(first_name: 'Sebastían', last_name: 'Carrasco', email: 'seba.carrasco@uc.cl', password: 'achuuuu', points: 18)
User.create(first_name: 'Alejandro', last_name: 'Plaza', email: 'aplaza2@uc.cl', password: 'compota', points: 3)
User.create(first_name: 'Diego', last_name: 'Costa', email: 'diegocostar@uc.cl', password: '123456', points: 503)

# Make fake publications
Publication.create(title: 'Ida a San Joaquín',
                   content: 'El lunes tengo prueba de cálculo a las 8:30 AM, así que partiré tipo 7 desde Ñuñoa para llegar mas o menos 8.', day: '2022-06-20', departure_time: '8:00', person_limit: 4, origin: 'Ñuñoa', destination: 'San Joaquín', user_id: 2)
Publication.create(title: 'Galita Ing',
                   content: 'Tengo una mini van y puedo llevar varias personas, pero solo de ida. Solo pediré que usen mascarilla dentro del auto.', day: '2022-06-16', departure_time: '8:00', person_limit: 7, origin: 'Casa Central', destination: 'Ex-Fábrica', user_id: 3)
Publication.create(title: 'Exámen VRA Ingles',
                   content: 'Auto pequeño pero muy cómodo. Estaré un poco apresurada, asi que necesito que estén sí o sí a la hora que coordinemos.', day: '2022-06-17', departure_time: '11:15', person_limit: 3, origin: 'Ñuñoa', destination: 'Lo Contador', user_id: 4)
Publication.create(title: 'Salida I3 Contabilidad',
                   content: 'Auto azul con 4 asientos disponibles. Mencionar que me gusta manejar con música algo fuerte, pero pueden traer sus propias playlist y yo feliz de colocarlas.', day: '2022-06-23', departure_time: '21:30', person_limit: 4, origin: 'Campus Oriente', destination: 'Providencia', user_id: 5)
Publication.create(title: 'Carrete derecho',
                    content: 'No visualizable', day: '2022-06-23', departure_time: '21:30', person_limit: 1, origin: 'Campus Oriente', destination: 'Macul', user_id: 7)
Publication.create(title: 'Exámen Electro',
                    content: 'El auto puede estar un poco carreteado por dentro, por si les molesta el olor un poco fuerte.', day: '2022-07-01', departure_time: '20:00', person_limit: 4, origin: 'San Joaquín', destination: 'La Florida', user_id: 9)
Publication.create(title: 'Laboratorio Química',
                    content: 'Esta publicación no debería visualizarse', day: '2022-06-23', departure_time: '21:30', person_limit: 1, origin: 'Campus Oriente', destination: 'Macul', user_id: 8)

# Create requests
Request.create(user_id: 5, publication_id: 1, status: 'approved')
Request.create(user_id: 3, publication_id: 2, status: 'approved')
Request.create(user_id: 4, publication_id: 2, status: 'approved')
Request.create(user_id: 7, publication_id: 2, status: 'approved')
Request.create(user_id: 6, publication_id: 3, status: 'approved')
Request.create(user_id: 2, publication_id: 2, status: 'approved')
Request.create(user_id: 6, publication_id: 4, status: 'approved')
Request.create(user_id: 2, publication_id: 5, status: 'approved')
Request.create(user_id: 6, publication_id: 6, status: 'approved')
Request.create(user_id: 8, publication_id: 2, status: 'pending')
Request.create(user_id: 8, publication_id: 4, status: 'rejected')
Request.create(user_id: 8, publication_id: 1, status: 'approved')
Request.create(user_id: 9, publication_id: 1, status: 'approved')
Request.create(user_id: 2, publication_id: 7, status: 'pending')

# Create reviews
Review.create(user_id: 2, publication_id: 1, score: 2)
Review.create(user_id: 7, publication_id: 1, score: 5)
Review.create(user_id: 3, publication_id: 2, score: 3)
Review.create(user_id: 4, publication_id: 2, score: 4)
Review.create(user_id: 4, publication_id: 3, score: 4)
Review.create(user_id: 5, publication_id: 4, score: 1)
Review.create(user_id: 7, publication_id: 5, score: 2)
Review.create(user_id: 1, publication_id: 6, score: 5)