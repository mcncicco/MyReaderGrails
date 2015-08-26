package br.ufpe.cin

class Feed {

    String nome
	String url
      
	static belongsTo = [ user : User ] 

    static hasMany = [entrys: Entry]

    static constraints = {
        //nome(size:6..45)
        //categoria(nullable: true)
    }

    static mapping = {
         categoria lazy:false
    }

}
