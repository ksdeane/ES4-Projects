if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2023.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "Z:/es4/lab5"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- lab5_impl_1.vm lab5_impl_1.ldc
run_engine_newmsg synthesis -f "lab5_impl_1_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o lab5_impl_1_syn.udb lab5_impl_1.vm] "Z:/es4/lab5/impl_1/lab5_impl_1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
