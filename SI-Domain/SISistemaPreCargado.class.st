Class {
	#name : #SISistemaPreCargado,
	#superclass : #SISistema,
	#category : #'SI-Domain'
}

{ #category : #'private - loading' }
SISistemaPreCargado >> cargarAutores: unArrayNombres [
	|autores autor|
	autores := OrderedCollection new.
	unArrayNombres do: [ :aNombre | autor := (SIAutor nombre: aNombre). colAutores add: autor. autores add: autor].
	^autores.
]

{ #category : #'private - loading' }
SISistemaPreCargado >> cargarLibros: biblioteca [
		biblioteca 				
			agregarLibro: (SILibro nombre: 'OpenGL SuperBible' editorial: 'Addison-Wesley Professional' año: 2013 autores: (self cargarAutores: #('Graham Sellers' 'Richard S. Wright' 'Jr. Nicholas Haemel')));
			agregarLibro: (SILibro nombre: 'Computer Organization and Design' editorial: 'Morgan Kaufmann' año: 2013 autores: (self cargarAutores: #('David A. Patterson' 'John L. Hennessy')));
			agregarLibro: (SILibro nombre: 'An Introduction to Formal Languages and Automata' editorial: 'Jones & Bartlett Learning' año: 2011 autores: (self cargarAutores: #('Peter Linz')));
			agregarLibro: (SILibro nombre: 'Pawn Structure Chess' editorial: 'Batsford' año: 2013 autores: (self cargarAutores: #('Andrew Soltis')));
			agregarLibro: (SIAudioLibro nombre: 'Dvoretsky''s Endgame Manual' editorial: 'Russell Enterprises, Inc' año: 2020 autores: (self cargarAutores: #('Mark Dvoretsky')));
			agregarLibro: (SILibro nombre: 'Positional Decision Making in Chess' editorial: 'Quality Chess' año: 2016 autores: (self cargarAutores: #('Boris Gelfand' 'Jacob Aagaard')));
			agregarLibro: (SILibro nombre: 'Technical Decision Making in Chess' editorial: 'Quality Chess' año: 2021 autores: (self cargarAutores: #('Boris Gelfand' 'Jacob Aagaard')));
			agregarLibro: (SILibro nombre: 'Dynamic Decision Making in Chess' editorial: 'Quality Chess' año: 2017 autores: (self cargarAutores: #('Boris Gelfand' 'Jacob Aagaard')));
			agregarLibro: (SILibro nombre: 'Fire on Board' editorial: 'Everyman Chess' año: 1997 autores: (self cargarAutores: #('Alexei Shirov')));
			agregarLibro: (SILibro nombre: 'Fire on Board, Part 2' editorial: 'Everyman Chess' año: 2005 autores: (self cargarAutores: #('Alexei Shirov')));
			agregarLibro: (SILibro nombre: 'Zurich International Chess Tournament, 1953' editorial: 'Dover Publications' año: 1979 autores: (self cargarAutores: #('David Bronstein')));
			agregarLibro: (SILibro nombre: 'My System' editorial: 'Quality Chess' año: 2007 autores: (self cargarAutores: #('Aron Nimzowitsch')));
			agregarLibro: (SILibro nombre: 'My Great Predecessors, Part 1' editorial: 'Everyman Chess' año: 2020 autores: (self cargarAutores: #('Garry Kasparov')));
			agregarLibro: (SILibro nombre: 'My Great Predecessors, Part 2' editorial: 'Everyman Chess' año: 2020 autores: (self cargarAutores: #('Garry Kasparov')));
			agregarLibro: (SILibro nombre: 'My Great Predecessors, Part 3' editorial: 'Everyman Chess' año: 2020 autores: (self cargarAutores: #('Garry Kasparov')));
			agregarLibro: (SILibro nombre: 'My Great Predecessors, Part 4' editorial: 'Everyman Chess' año: 2020 autores: (self cargarAutores: #('Garry Kasparov')));
			agregarLibro: (SILibro nombre: 'My Great Predecessors, Part 5' editorial: 'Everyman Chess' año: 2020 autores: (self cargarAutores: #('Garry Kasparov')));
			agregarLibro: (SILibro nombre: 'The Woodpecker Method' editorial: 'Quality Chess' año: 2019 autores: (self cargarAutores: #('Axel Smith')));
			agregarLibro: (SILibro nombre: 'Bobby Fischer Teaches Chess' editorial: 'Bantam' año: 1982 autores: (self cargarAutores: #('Bobby Fischer' 'Stuart Margulies' 'Don Mosenfelder')));
			agregarLibro: (SILibro nombre: 'Deep Thinking: Where Machine Intelligence Ends and Human Creativity Begins' editorial: 'PublicAffairs' año: 2017 autores: (self cargarAutores: #('Axel Smith')));
			agregarLibro: (SILibro nombre: 'The Master of Improvisation' editorial: 'Chessy' año: 2007	 autores: (self cargarAutores: #('David Bronstein' 'Boris Vainstein')));
			agregarLibro: (SILibro nombre: 'Alekhine Alert!' editorial: 'Everyman Chess' año: 2010 autores: (self cargarAutores: #('Timothy Taylor')));
			agregarLibro: (SILibro nombre: 'Think Like A Grandmaster' editorial: 'Batsford' año: 2003	 autores: (self cargarAutores: #('Alexander Kotov')));
			agregarLibro: (SILibro nombre: 'Najdorf poisoned pawn' editorial: 'nan' año: 1977	 autores: (self cargarAutores: #('Jimmy Adams')));
			agregarLibro: (SILibro nombre: 'Opening Developments' editorial: 'Edition Olms' año: 2009	 autores: (self cargarAutores: #('Mark Dvoretsky')));
			agregarLibro: (SILibro nombre: 'The French Tarrasch' editorial: 'Batsford' año: 1998 autores: (self cargarAutores: #('John Emms'))).
	^biblioteca libros.
]

{ #category : #initialization }
SISistemaPreCargado >> initialize [ 
	|seba a b c aLibros bLibros cLibros |
	super initialize.
	self agregarUsuario: (seba := SIUsuario dni: 39062823 nombre: 'Sebastian' apellido: 'Iovaldi' password: '1234');
			agregarUsuario: (SIUsuario dni: 43484212 nombre: 'Leonard' apellido: 'Fernandez' password: 1234);
			agregarUsuario: (SIUsuario dni: 44216402 nombre: 'Medel' apellido: 'Joaquin' password: 1234);
			agregarUsuario: (SIUsuario dni: 43275843 nombre: 'Leonel' apellido: 'Llancaqueo' password: 1234);
			agregarUsuario: (SIUsuario dni: 44287842 nombre: 'Cristopher' apellido: 'Ovaillos' password: 1234).

	aLibros := self cargarLibros: (self agregarBiblioteca: (a := SIBiblioteca id: 'A' nombre: 'Juan Bautista Alberdi'  telefono: 45228338 direccion: 'Av. Argentina 844' representante: 'Bernardino Teruel')).
	bLibros := self cargarLibros: (self agregarBiblioteca: (b := SIBiblioteca id: 'B' nombre: 'Francisco P. Moreno' telefono: 45132458 direccion: 'Av. Leloir y Sta Fe' representante: 'Yeray Salazar')).
	cLibros := self cargarLibros: (self agregarBiblioteca: (c := SIBiblioteca id: 'C' nombre: 'Juan Jose Brion' telefono: 42658752 direccion: 'Av. Leloir 842'  representante: 'Guillermina Llorens' )).
			
	b registrarPrestamoAtrasadoUsuario: seba libros: (OrderedCollection new add: (bLibros at: 3); 
																						add: (bLibros at: 8);
																						yourself).			
"					
	c registrarPrestamoUsuario: seba 
	libros: (OrderedCollection new add: (Libro nombre: 'My Great Predecessors, Part 1' editorial: 'Everyman Chess' año: 2020 autores: (self cargarAutores: #('Garry Kasparov'))); yourself)."
	^self
]
