package evidencije.dnevnik.bean;

import java.util.*;
import java.io.*;

public class Biljeska implements Serializable{
	private Date datum; 
	private String text;
	
	public Date getDatum(){
		return datum; 
	}
	
	public String getText(){
		return text;
	}
	
	public void setDatum(Date date){
		datum = date;
	}
	
	public void setText(String tekst){
		text = tekst;
	}
	
	@Override
	public boolean equals(Object o){
		if(o instanceof Biljeska){
			Biljeska b = (Biljeska) o; 
			if(!datum.equals(b.datum)) return false; 
			if(!text.equals(b.text)) return false; 
		}
		return false;
	}
	
	@Override
	public String toString(){
		String text = "";
		for(String line: this.text.split("\n")){
			text+="\t"+line+"\n"; 
		}
		return "<b>"+datum+"</b></br></br><pre>"+text+"</pre>"; 
	}
}


