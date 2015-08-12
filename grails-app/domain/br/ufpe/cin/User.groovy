package br.ufpe.cin

class User {

    String nome
	String email
    String password

    static hasMany = [feeds: Feed]

    static constraints = {
        //nome(size:6..45)
        //categoria(nullable: true)
    }

    static mapping = {
         //categoria lazy:false
    }

}

