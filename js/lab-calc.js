// Drives the Labyrinth Calculator

window.labcalc = {
    init: function(){
        var _inputs = [ "life", "shield", "percentregen", "scionoccultist", "zealotsoath", "shaperseed", "shavsrevel", "endregen",
                        "vitalitylevel", "rejuvlevel", "basalt", "flaskeffect", "soulofsteel", "endcharges", "arctic", "trapdps" ],
            _outputs = ["liferegenflat", "liferegenpercent", "shieldregenflat", "shieldregenpercent", "extraphysred", "armour" ];
            _rejuv = [ 0, 6.3, 8.7, 12.4, 16.0, 21.0, 26.3, 32.2, 39.4, 46.1, 53.7, 61.8, 72.8, 82.7, 92.7, 102.8, 114.0,
                       123.0, 135.6, 149.0, 162.2, 168.6, 177.0, 182.1, 191.2, 200.7, 206.0, 217.4, 227.9, 241.2, 243.7],
            _arctic = [ 0, 0.08, 0.08, 0.09, 0.09, 0.09, 0.09, 0.10, 0.10, 0.10, 0.10, 0.11, 0.11, 0.11, 0.11,
                        0.12, 0.12, 0.12, 0.12, 0.13, 0.13, 0.13, 0.13, 0.14, 0.14, 0.14, 0.14, 0.15, 0.15, 0.15, 0.15 ]
        
        window.labcalc = {
            init: window.labcalc.init,
            inputs: {},
            outputs: {},
            
            trapdegen: function(){
                var degenp = +this.inputs.trapdps.value / 100;
                return degenp * (+this.inputs.life.value + 0.6 * +this.inputs.shield.value);
            },
            
            basereduction: function(){
                var basalt    = this.inputs.basalt.checked,
                    feff      = +this.inputs.flaskeffect.value,
                    basaltred = basalt ? Math.floor(20 * (1 + feff/100)) : 0,
                    endred    = +this.inputs.endcharges.value * 4,
                    soulred   = this.inputs.soulofsteel.checked ? 4 : 0;
                return basaltred + endred + soulred;
            },
            
            liferegen_percent: function(){
                var treep    = +this.inputs.percentregen.value / 100,
                    shaperp  = this.inputs.shaperseed.checked ? 0.02 : 0,
                    chargesp = +this.inputs.endregen.value / 100 * +this.inputs.endcharges.value,
                    vitp     = this.vitality();
                return treep + shaperp + chargesp + vitp;
            },
            
            liferegen_flat: function(){
                return this.rejuv();
            },
            
            liferegen: function(){
                var zo = this.inputs.zealotsoath.checked;
                return zo ? 0 : this.liferegen_percent() * +this.inputs.life.value + this.liferegen_flat();
            },
            
            shieldregen: function(){
                var scionoccultistp = this.inputs.scionoccultist.checked ? .01 : 0,
                    shavsrevelp     = this.inputs.shavsrevel.checked ? .03 : 0,
                    zo              = this.inputs.zealotsoath.checked,
                    zop             = zo ? this.liferegen_percent() : 0,
                    zoflat          = zo ? this.liferegen_flat() : 0;
                return (scionoccultistp + shavsrevelp + zop) * +this.inputs.shield.value + zoflat;
            },
            
            rejuv: function(){
                var rejuvlevel = +this.inputs.rejuvlevel.value;
                return _rejuv[rejuvlevel];
            },
            
            reduction_needed: function(){
                return Math.ceil(100 - (100 * (this.liferegen() + this.shieldregen()) / this.trapdps()) - this.basereduction());
            },
            
            armour_needed: function(){
                var hit = this.traphit(),
                    red = this.reduction_needed();
                return Math.ceil(red / 100 * 10 * hit / (1 - red / 100));
            },
            
            vitality: function(){
                var vitlevel = +this.inputs.vitalitylevel.value;
                return vitlevel === 0 ? 0 : 0.0065 + vitlevel * 0.0005;
            },
            
            update: function(){
                this.outputs.liferegenflat.value = this.liferegen();
                this.outputs.liferegenpercent.value = 100 * +this.outputs.liferegenflat.value / +this.inputs.life.value;
                this.outputs.shieldregenflat.value = this.shieldregen();
                this.outputs.shieldregenpercent.value = 100 * +this.outputs.shieldregenflat.value / +this.inputs.shield.value || 0;
                this.outputs.extraphysred.value = this.reduction_needed();
                this.outputs.armour.value = this.armour_needed();
            }
        }
        
        // Populate window.labcalc.inputs resp. outputs with references to these elements
        for (var i = 0; i < _inputs.length; i++) {
            window.labcalc.inputs[_inputs[i]] = document.getElementById(_inputs[i]);
        }
        for (var i = 0; i < _outputs.length; i++) {
            window.labcalc.outputs[_outputs[i]] = document.getElementById(_outputs[i]);
        }
        
        window.labcalc.update();
    }
}