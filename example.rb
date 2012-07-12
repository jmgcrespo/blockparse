require "trollop"
load "blockparse.rb"

opts = Trollop::options do
   opt :ifile, "Input File", :type => String, :required => true

   
 end
 ifile = opts[:ifile]
if(not File.exists?(ifile))
  raise RuntimeError, "Input file #{ifile} can't be found"
end



		
###############
$pat=Hash.new
$pat[["cnx_id","fuji"]]=/^Connection index 0x(.+)\(\d+\) \[ Fuji (0) \]/

# $pat["lk_ipv4_protocol_type"] = /IPV4 Protocol Type\s+(\w+)/
 $pat["lk_ipv4_dip"] = /IPV4 DIP\s+(.+)/
 $pat["lk_ipv4_sip"] = /IPV4 SIP\s+(.+)/
# $pat["lk_l4_dest_port"] = /L4 Dest Port\s+.+\(\d+\)/
# $pat["lk_l4_source_port"] = /L4 Source Port\s+.+\(\d+\)/
# $pat["ts_mtype"]=/Mtype = (.+)/
 #$pat["ts_flow_id"]=/Flow Id = (.*)/
 #$pat[["ts_out_mirrir_dis","ts_in_mirror_dis","ts_snoop","ts_exc_src_port","ts_drop_prec","ts_src_port"]] =
 #     /Out Mirror Dis =\s*(.*), In Mirror Dis =\s*(.*), Snoop =\s*(.*), Exc Src Port =\s*(.*), Drop Prec =\s*(.*), Src Port Ext =\s*(.*)/ 
# $pat[["s_tagging","s_out","s_tci","s_use_alt_ethertype"]] = /(.*), Out = (.*), TCI = (.*), Use Alt EtherType = (.*)/
# $pat[["s_mirror_cmd","s_mirrircnt","s_lag_hash","s_arl","s_irl","s_error_bits"]] = /Mirror Cmd = (.*), MirrorCnt = (.*), Lag Hash = (.*), ARL = (.*), IRL = (.*), Error Bits = (.*)/
 #$pat[["s_source_port","s_dest_port","s_priority"]] = /Source Port = (.*), Dest Port = (.*), Priority = (.*)/
# $pat["ss_packet_count_upper"] = /Packet Count Upper\s+(\d+)/
# $pat["ss_packet_count_lower"] = /Packet Count Lower\s+(\d+)/
# $pat["ss_byte_count_upper"] = /Byte Count Upper\s+(\d+)/
# $pat["ss_byte_count_lower"] = /Byte Count Lower\s+(\d+)/


################
 file = File.open(ifile)

  
 myregex=BlockParse.new(file,$pat)
 cnx=myregex.parse
 header=myregex.header
 header.each { |key|  print key.to_s + "    " }
 puts ""
 cnx.each { |block| 
 header.each { |key|  print block[key].to_s + "    " }
 puts ""
 }
 
  

 






 

 
 