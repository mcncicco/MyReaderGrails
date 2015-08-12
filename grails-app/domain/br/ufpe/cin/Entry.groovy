package br.ufpe.cin


class Entry {

    String nome
	String url

    static belongsTo = [ feed : Feed ] 

	 static constraints = {
        //nome(size:6..45)
        //categoria(nullable: true)
    }

    static mapping = {
         //categoria lazy:false
    }

}
