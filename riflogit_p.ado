*! version 1.0.0  26jul2022  Ben Jann

program riflogit_p
    version 11
    if `"`e(cmd)'"'!="riflogit" {
        di as err "last riflogit results not found"
        exit 301
    }
    syntax [anything] [if] [in] [, SCores * ]
    if `"`scores'"' != "" {
        _score_spec `anything', scores
        local vname `s(varlist)'
        local vtyp  `s(typlist)'
        local weight `"`e(wtype)'"'
        if "`weight'"=="pweight" {
            local wgt `"[aweight`e(wexp)']"'
        }
        else if "`weight'"!="" {
            local wgt `"[`weight'`e(wexp)']"'
        }
        tempvar Y RIF XB
        local depvar `"`e(depvar)'"'
        qui gen byte `Y' = (`depvar'!=0) if `depvar'<.
        riflogit_RIF `Y' `RIF' e(sample) `"`wgt'"'
        qui _predict double `XB'
        gen `vtyp' `vname' = (`RIF' - `XB') / e(rmse)^2 `if' `in'
        lab var `vname' "score from riflogit"
        exit
    }
    qui _predict `anything' `if' `in', `options'
end
