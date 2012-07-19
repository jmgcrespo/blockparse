
class BlockParse

    def  initialize(input,pat1,*pat2)

		@input = input
		@header=Array.new
		@pat=pat1
		@pat.each_key { |v| @header.concat([*v])}
		@head_pat=Hash[*@pat.shift]

		
        
    end
        attr_reader :header
    
	public


	
	def each
	
	block=Hash.new
	
		block, all_block = self.next

		while ( block.class == Hash  )

		yield block , all_block 

		block, all_block  = self.next

		end
	end
	
	def next
	
	start_flag = ""
	aux_pat = Hash.new
	
		while line=@input.gets
		
		
				if ( m=@head_pat.values[0].match(line))
				
					 if ( start_flag != "" )
					 @input.lineno=(@input.lineno - 1 ) 
					 break 
					 end
					
					block=Hash.new
					all_block=Array.new
					updateHash(block,@head_pat.keys[0],m[1, m.length - 1 ] )
					all_block.push(line)
					start_flag = 1
					aux_pat=@pat.clone
		
					next
				
				end
		
				next if ( start_flag == "" )
			       
			        aux_pat.each { |key,value|

			 
						if ( m=value.match(line) )	

							updateHash(block, key, m[1, m.length - 1 ])
							aux_pat.delete(key)
					 
						end
					}
	  
	  		   	all_block.push(line)

			
		end
		
			
			return block, all_block
		
	
	end


	
	def parse 
		cnx=Array.new
		self.each { |block| cnx.push(block) }
        return cnx
	end
    
		
	private
	
	def updateHash ( hash, key, value )

		if ( key.class == Array )
	    
			key.each_index { |index|

				hash[key[index]]=value[index]
			}
		else
	 
			hash[key]=value[0]
	 
		end
	 
	end


end	




 
 