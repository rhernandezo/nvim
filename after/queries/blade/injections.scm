; Inyectar HTML en el contenido
((text) @injection.content
 (#set! injection.combined)
 (#set! injection.language "html"))

; Inyectar PHP en parámetros de directivas
((parameter) @injection.content
 (#set! injection.language "php"))
