<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.5.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ngspice-digital" urn="urn:adsk.eagle:library:5610454">
<description>SPICE compatible library parts</description>
<packages>
</packages>
<symbols>
<symbol name="OR" urn="urn:adsk.eagle:symbol:5610478/1" library_version="2">
<wire x1="-1.27" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-6.35" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-6.35" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.2446" y1="-5.0678" x2="7.5439" y2="0.0507" width="0.4064" layer="94" curve="60.147761" cap="flat"/>
<wire x1="-1.2446" y1="5.0678" x2="7.5442" y2="-0.0505" width="0.4064" layer="94" curve="-60.148802" cap="flat"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94" curve="-77.319617"/>
<text x="-7.62" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-12.7" y="2.54" visible="pad" length="middle" swaplevel="1"/>
<pin name="B" x="-12.7" y="-2.54" visible="pad" length="middle" swaplevel="1"/>
<pin name="Y" x="12.7" y="0" visible="pad" length="middle" direction="out" rot="R180"/>
</symbol>
<symbol name="AND" urn="urn:adsk.eagle:symbol:5610471/1" library_version="2">
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="2.54" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="-5.08" width="0.4064" layer="94" curve="-180"/>
<wire x1="2.54" y1="5.08" x2="-7.62" y2="5.08" width="0.4064" layer="94"/>
<text x="-7.62" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-12.7" y="2.54" visible="pad" length="middle" swaplevel="1"/>
<pin name="B" x="-12.7" y="-2.54" visible="pad" length="middle" swaplevel="1"/>
<pin name="Y" x="12.7" y="0" visible="pad" length="middle" direction="out" rot="R180"/>
</symbol>
<symbol name="XOR" urn="urn:adsk.eagle:symbol:5610458/1" library_version="2">
<wire x1="-1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-6.35" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-6.35" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.2446" y1="-5.0678" x2="7.5439" y2="0.0507" width="0.4064" layer="94" curve="60.147761" cap="flat"/>
<wire x1="-1.2446" y1="5.0678" x2="7.5442" y2="-0.0505" width="0.4064" layer="94" curve="-60.148802" cap="flat"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94" curve="-77.319617"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.4064" layer="94" curve="-77.319617" cap="flat"/>
<text x="-7.62" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-12.7" y="2.54" visible="pad" length="middle" swaplevel="1"/>
<pin name="B" x="-12.7" y="-2.54" visible="pad" length="middle" swaplevel="1"/>
<pin name="Y" x="12.7" y="0" visible="pad" length="middle" direction="out" rot="R180"/>
</symbol>
<symbol name="INVERTER" urn="urn:adsk.eagle:symbol:5610467/1" library_version="2">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<text x="2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="I" x="-10.16" y="0" visible="pad" length="middle"/>
<pin name="O" x="10.16" y="0" visible="pad" length="middle" direction="out" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="OR" urn="urn:adsk.eagle:component:5610505/1" prefix="X" library_version="2">
<description>2 input logic OR gate</description>
<gates>
<gate name="G$1" symbol="OR" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="X">
<pinmap gate="G$1" pin="A" pinorder="1"/>
<pinmap gate="G$1" pin="B" pinorder="2"/>
<pinmap gate="G$1" pin="Y" pinorder="3"/>
</pinmapping>
<model name="OR2">
**********************
* Autodesk EAGLE - SPICE Model File
**********************
.SUBCKT OR2 A B OUT
a1 [A B] OUT or2
.model or2 d_or(rise_delay = 1n fall_delay = 1n)
.ENDS OR2</model>
</spice>
</deviceset>
<deviceset name="AND" urn="urn:adsk.eagle:component:5610500/1" prefix="X" library_version="2">
<description>2 input logic AND gate</description>
<gates>
<gate name="G$1" symbol="AND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="X">
<pinmap gate="G$1" pin="A" pinorder="1"/>
<pinmap gate="G$1" pin="B" pinorder="2"/>
<pinmap gate="G$1" pin="Y" pinorder="3"/>
</pinmapping>
<model name="AND2">
**********************
* Autodesk EAGLE - SPICE Model File
**********************
.SUBCKT AND2 A B OUT
a1 [A B] OUT and2
.model and2 d_and(rise_delay = 1n fall_delay = 1n)
.ENDS AND2</model>
</spice>
</deviceset>
<deviceset name="XOR" urn="urn:adsk.eagle:component:5610485/1" prefix="X" library_version="2">
<description>2 input XOR gate</description>
<gates>
<gate name="G$1" symbol="XOR" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="X">
<pinmap gate="G$1" pin="A" pinorder="1"/>
<pinmap gate="G$1" pin="B" pinorder="2"/>
<pinmap gate="G$1" pin="Y" pinorder="3"/>
</pinmapping>
<model name="XOR2">
**********************
* Autodesk EAGLE - SPICE Model File
**********************
.SUBCKT XOR2 A B OUT
a1 [A B] OUT xor2
.model xor2 d_xor(rise_delay = 1n fall_delay = 1n)
.ENDS XOR2</model>
</spice>
</deviceset>
<deviceset name="INVERTER" urn="urn:adsk.eagle:component:5610494/1" prefix="X" library_version="2">
<description>logic inverter (NOT gate)</description>
<gates>
<gate name="G$1" symbol="INVERTER" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="X">
<pinmap gate="G$1" pin="I" pinorder="1"/>
<pinmap gate="G$1" pin="O" pinorder="2"/>
</pinmapping>
<model name="INV">
**********************
* Autodesk EAGLE - SPICE Model File
**********************
.SUBCKT INV IN OUT
a1 IN OUT inv1
.model inv1 d_inverter(rise_delay = 1n fall_delay = 1n)
.ENDS INV</model>
</spice>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="X1" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="OR" device=""/>
<part name="X2" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="OR" device=""/>
<part name="X3" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="OR" device=""/>
<part name="X4" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="AND" device=""/>
<part name="X5" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="AND" device=""/>
<part name="X6" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="XOR" device=""/>
<part name="X7" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="INVERTER" device=""/>
<part name="X8" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="INVERTER" device=""/>
<part name="X9" library="ngspice-digital" library_urn="urn:adsk.eagle:library:5610454" deviceset="INVERTER" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="20.32" y="5.08" size="1.778" layer="91" rot="MR0">Fig. - Ex 4.1 </text>
</plain>
<instances>
<instance part="X1" gate="G$1" x="142.24" y="88.9" smashed="yes">
<attribute name="NAME" x="134.62" y="95.25" size="1.778" layer="95"/>
<attribute name="VALUE" x="134.62" y="81.28" size="1.778" layer="96"/>
</instance>
<instance part="X2" gate="G$1" x="203.2" y="78.74" smashed="yes">
<attribute name="NAME" x="195.58" y="85.09" size="1.778" layer="95"/>
<attribute name="VALUE" x="195.58" y="71.12" size="1.778" layer="96"/>
</instance>
<instance part="X3" gate="G$1" x="187.96" y="35.56" smashed="yes">
<attribute name="NAME" x="180.34" y="41.91" size="1.778" layer="95"/>
<attribute name="VALUE" x="180.34" y="27.94" size="1.778" layer="96"/>
</instance>
<instance part="X4" gate="G$1" x="83.82" y="83.82" smashed="yes">
<attribute name="NAME" x="76.2" y="90.17" size="1.778" layer="95"/>
<attribute name="VALUE" x="76.2" y="76.2" size="1.778" layer="96"/>
</instance>
<instance part="X5" gate="G$1" x="83.82" y="58.42" smashed="yes">
<attribute name="NAME" x="76.2" y="64.77" size="1.778" layer="95"/>
<attribute name="VALUE" x="76.2" y="50.8" size="1.778" layer="96"/>
</instance>
<instance part="X6" gate="G$1" x="142.24" y="50.8" smashed="yes">
<attribute name="NAME" x="134.62" y="57.15" size="1.778" layer="95"/>
<attribute name="VALUE" x="134.62" y="43.18" size="1.778" layer="96"/>
</instance>
<instance part="X7" gate="G$1" x="33.02" y="88.9" smashed="yes">
<attribute name="NAME" x="35.56" y="91.44" size="1.778" layer="95"/>
<attribute name="VALUE" x="35.56" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="X8" gate="G$1" x="33.02" y="60.96" smashed="yes">
<attribute name="NAME" x="35.56" y="63.5" size="1.778" layer="95"/>
<attribute name="VALUE" x="35.56" y="55.88" size="1.778" layer="96"/>
</instance>
<instance part="X9" gate="G$1" x="220.98" y="35.56" smashed="yes">
<attribute name="NAME" x="223.52" y="38.1" size="1.778" layer="95"/>
<attribute name="VALUE" x="223.52" y="30.48" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="A" class="0">
<segment>
<label x="-17.78" y="101.6" size="1.778" layer="95"/>
<wire x1="-17.78" y1="101.6" x2="12.7" y2="101.6" width="0.1524" layer="91"/>
<wire x1="12.7" y1="101.6" x2="124.46" y2="101.6" width="0.1524" layer="91"/>
<wire x1="124.46" y1="101.6" x2="124.46" y2="91.44" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="A"/>
<wire x1="124.46" y1="91.44" x2="129.54" y2="91.44" width="0.1524" layer="91"/>
<pinref part="X8" gate="G$1" pin="I"/>
<wire x1="22.86" y1="60.96" x2="12.7" y2="60.96" width="0.1524" layer="91"/>
<wire x1="12.7" y1="60.96" x2="12.7" y2="101.6" width="0.1524" layer="91"/>
<junction x="12.7" y="101.6"/>
</segment>
</net>
<net name="B" class="0">
<segment>
<wire x1="-17.78" y1="88.9" x2="0" y2="88.9" width="0.1524" layer="91"/>
<label x="-20.32" y="88.9" size="1.778" layer="95"/>
<pinref part="X7" gate="G$1" pin="I"/>
<wire x1="0" y1="88.9" x2="22.86" y2="88.9" width="0.1524" layer="91"/>
<wire x1="0" y1="88.9" x2="0" y2="50.8" width="0.1524" layer="91"/>
<wire x1="0" y1="50.8" x2="71.12" y2="50.8" width="0.1524" layer="91"/>
<pinref part="X5" gate="G$1" pin="B"/>
<wire x1="71.12" y1="50.8" x2="71.12" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="C" class="0">
<segment>
<label x="-17.78" y="76.2" size="1.778" layer="95"/>
<wire x1="-17.78" y1="76.2" x2="71.12" y2="76.2" width="0.1524" layer="91"/>
<pinref part="X4" gate="G$1" pin="B"/>
<wire x1="71.12" y1="76.2" x2="71.12" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D" class="0">
<segment>
<label x="-17.78" y="45.72" size="1.778" layer="95"/>
<wire x1="-17.78" y1="48.26" x2="96.52" y2="48.26" width="0.1524" layer="91"/>
<pinref part="X6" gate="G$1" pin="B"/>
<pinref part="X3" gate="G$1" pin="B"/>
<wire x1="96.52" y1="48.26" x2="129.54" y2="48.26" width="0.1524" layer="91"/>
<wire x1="96.52" y1="48.26" x2="96.52" y2="33.02" width="0.1524" layer="91"/>
<wire x1="96.52" y1="33.02" x2="175.26" y2="33.02" width="0.1524" layer="91"/>
<junction x="96.52" y="48.26"/>
</segment>
</net>
<net name="F1" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="Y"/>
<wire x1="215.9" y1="78.74" x2="228.6" y2="78.74" width="0.1524" layer="91"/>
<label x="228.6" y="78.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="F2" class="0">
<segment>
<pinref part="X9" gate="G$1" pin="O"/>
<wire x1="231.14" y1="35.56" x2="241.3" y2="35.56" width="0.1524" layer="91"/>
<label x="241.3" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="T5" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="Y"/>
<pinref part="X9" gate="G$1" pin="I"/>
<wire x1="200.66" y1="35.56" x2="210.82" y2="35.56" width="0.1524" layer="91"/>
<label x="200.66" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="T3" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="Y"/>
<wire x1="154.94" y1="88.9" x2="180.34" y2="88.9" width="0.1524" layer="91"/>
<wire x1="180.34" y1="88.9" x2="180.34" y2="81.28" width="0.1524" layer="91"/>
<pinref part="X2" gate="G$1" pin="A"/>
<wire x1="180.34" y1="81.28" x2="190.5" y2="81.28" width="0.1524" layer="91"/>
<label x="157.48" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="T4" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="B"/>
<wire x1="190.5" y1="76.2" x2="180.34" y2="76.2" width="0.1524" layer="91"/>
<wire x1="180.34" y1="76.2" x2="180.34" y2="50.8" width="0.1524" layer="91"/>
<pinref part="X6" gate="G$1" pin="Y"/>
<wire x1="180.34" y1="50.8" x2="154.94" y2="50.8" width="0.1524" layer="91"/>
<label x="154.94" y="50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="T1" class="0">
<segment>
<pinref part="X4" gate="G$1" pin="Y"/>
<pinref part="X1" gate="G$1" pin="B"/>
<wire x1="96.52" y1="83.82" x2="129.54" y2="83.82" width="0.1524" layer="91"/>
<wire x1="129.54" y1="83.82" x2="129.54" y2="86.36" width="0.1524" layer="91"/>
<label x="99.06" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="X7" gate="G$1" pin="O"/>
<wire x1="43.18" y1="88.9" x2="71.12" y2="88.9" width="0.1524" layer="91"/>
<pinref part="X4" gate="G$1" pin="A"/>
<wire x1="71.12" y1="88.9" x2="71.12" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="T2" class="0">
<segment>
<pinref part="X5" gate="G$1" pin="Y"/>
<wire x1="96.52" y1="58.42" x2="129.54" y2="58.42" width="0.1524" layer="91"/>
<pinref part="X6" gate="G$1" pin="A"/>
<wire x1="129.54" y1="58.42" x2="129.54" y2="53.34" width="0.1524" layer="91"/>
<label x="99.06" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="A"/>
<wire x1="175.26" y1="38.1" x2="129.54" y2="38.1" width="0.1524" layer="91"/>
<wire x1="129.54" y1="38.1" x2="129.54" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="X8" gate="G$1" pin="O"/>
<pinref part="X5" gate="G$1" pin="A"/>
<wire x1="43.18" y1="60.96" x2="71.12" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.4" severity="warning">
Since Version 8.4, EAGLE supports properties for SPICE simulation. 
Probes in schematics and SPICE mapping objects found in parts and library devices
will not be understood with this version. Update EAGLE to the latest version
for full support of SPICE simulation. 
</note>
</compatibility>
</eagle>
