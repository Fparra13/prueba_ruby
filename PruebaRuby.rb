def read_alumnos(file)
  file = File.open(file, 'r')
  contenido = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  contenido
end
contenido = read_alumnos('nombre_notas.csv')

hash = {}
contenido.each {|i| hash [i[0].to_sym] = i[0..5].map {|num| num.to_i}}

puts '>>>>>>>>>>Seleccione la opción deseada<<<<<<<<<<'

opcion = 0
until opcion == 4 do
  
  puts '1) Mostrar promedio del alumno'
  puts '2) Mostrar inasistencias'
  puts '3) Mostrar alumnos aprobados'
  puts '4) Salir'

  opcion = gets.chomp.to_i

case opcion
when 1
    suma = hash.values.map { |array| array.inject { |acum, nota| acum + nota} }
    prom = suma.map {|n| n / 5.0}
    promedio_alumno= hash.keys.zip(prom).to_h
    promedio_alumno.each {|alumno, nota| puts "El promedio de #{alumno} es de #{nota} puntos"}


when 2
    ausencias = hash.values.collect { |array| array.count(0) }
    ausencias_alumno = hash.keys.zip(ausencias).to_h
    ausencias_alumno.each { |alumno, inasistencia| puts "#{alumno} tiene #{inasistencia} inasistencias" }
    print ausencias_alumno


when 3
    sumas = hash.values.map {|array| promedios = array.inject {|acum, nota| acum + nota}}
    promedios = sumas.map {|n| n / 5.0}
    promedio_alumnos = hash.keys.zip(promedios).to_h
    promedio_alumnos.each do |nombre, nota|
      puts "#{nombre} aprobado :)" if nota > 5
    end

when 4
    puts "Hasta Pronto :)"

  else
    puts 'Opción no válida! vuelva a ingresar su opcion (entre 1 y 4)'

end
end