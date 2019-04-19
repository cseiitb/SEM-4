#Topology: A---R---B

#Create a simulator object
set ns [new Simulator]

#Open the nam file simple-tcp.nam and the variable-trace file simple-tcp.trace
set nf [open simple-tcp.nam w]
$ns namtrace-all $nf
set f [open simple-tcp.tr w]
set ftcp [open tcp-trace.tr w]
$ns trace-all $f

#Define a 'finish' procedure
proc finish {} {
        global ns nf f ftcp
        $ns flush-trace	
        close $nf		
        close $f
	close $ftcp
        exit 0
}

#Create the network nodes
set A [$ns node]
set R [$ns node]
set B [$ns node]

#Create a duplex link between the nodes

$ns duplex-link $A $R 10Mb 10ms DropTail
$ns duplex-link $R $B 800Kb 50ms DropTail

# The queue size at $R 
$ns queue-limit $R $B 12

# some hints for nam
# color packets of flow 0 red
$ns color 0 Red			
$ns duplex-link-op $A $R orient right
$ns duplex-link-op $R $B orient right
$ns duplex-link-op $R $B queuePos 0.5

# Create a TCP sending agent and attach it to A
#set tcp0 [new Agent/TCP]
set tcp0 [new Agent/TCP/Reno]
#set tcp0 [new Agent/TCP/Newreno]
#set tcp0 [new Agent/TCP/Sack1]


# make our one-and-only flow be flow 0
$tcp0 set class_ 0
$tcp0 set window_ 100
$tcp0 set packetSize_ 960
$ns attach-agent $A $tcp0

# Let's trace some TCP variables
$tcp0 attach $ftcp
$tcp0 tracevar cwnd_
$tcp0 tracevar ssthresh_
$tcp0 tracevar ack_
$tcp0 tracevar maxseq_

#Create a TCP receive agent (a traffic sink) and attach it to B
set end0 [new Agent/TCPSink]
$ns attach-agent $B $end0

#Connect the traffic source with the traffic sink
$ns connect $tcp0 $end0  

#Schedule the connection data flow; start sending data at T=0, stop at T=20.0
set myftp [new Application/FTP]
$myftp attach-agent $tcp0
$ns at 0.0 "$myftp start"
$ns at 20.0 "finish"


#Run the simulation
$ns run
