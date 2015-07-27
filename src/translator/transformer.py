import sets

#program: list -> list
def program(P):
	progr = ['progr']
	for p in P[1:]:
		if p[0] == 'tdecls':
			progr = progr + [sort_defs(p)]
	progr = progr + [pred_decls(P)]
	for p in P[1:]:
		if p[0] == 'rules':
			progr = progr + [rules(p)]
	return progr

######################################################################

# sort_defs: list -> list
def sort_defs(T):
    if T[0] in sets.terminals:
        return T
    elif T[0] == 'tdecl':
        sdefs = ['sdef']
        for t in T[1:]:
            sdefs = sdefs + [sort_defs(t)]
        return sdefs
    elif T[0] == 'tdecls':
        sdefs = ['sdefs']
        for t in T[1:]:
            sdefs = sdefs + [sort_defs(t)]
        return sdefs
    else:
        sdefs = T[:1]
        for t in T[1:]:
            sdefs = sdefs + [sort_defs(t)]
        return sdefs
		
# Sort_names: list -> set
def Sort_names(T):
	if T[0] in sets.terminals:
		return set()
	elif T[0] == 'tdecl':
		return {T[1][1]}
	else:
		Snames = set()
		for t in T[1:]:
			Snames = Snames | Sort_names(t)
		return Snames

######################################################################

def pred_decls(T):
	pdecls = ['stmts']
	Preds = Predicates(T)
	for pred in Preds:
		if pred[1] == 0:
			pdecls = pdecls + [['pdecl', ('identifier', pred[0])]]
		else:
			pdecl = ['pdecl', ('identifier', pred[0])]
			for sname in Sort_names(T):
				domain = sname
			snames = ['snames']
			for i in range(0, pred[1]):
				snames = snames + [['sname', ('identifier', domain)]]
			pdecl = pdecl + [snames]
			pdecls = pdecls + [pdecl]
	pdecls = ['pdecls', pdecls]
	return pdecls

# Predicates: list -> set(pair)
def Predicates(T):
	if T[0] in sets.terminals:
		return set()
	elif T[0] == 'patom':
		if len(T) == 2:
			return {(T[1][1], 0)}
		else:
			return {(T[1][1], len(T[2]) - 1)}
	else:
		Preds = set()
		for t in T[1:]:
			Preds = Preds | Predicates(t)
		return Preds
		
######################################################################

# rules: list -> list
def rules(T):
    if T[0] in sets.terminals:
        return T        
    elif T[0] == 'neg_literal':
        return ['not_literal', rules(T[1])]
    elif T[0] == 'rule':
        if len(T) == 2:
            return ['fact', ['head', rules(T[1][1])]]
        else:
            return ['long_rule', ['head', rules(T[1][1])], ['body', rules(T[2][1])]]
    else:
        ruls = T[:1]
        for t in T[1:]:
            ruls = ruls + [rules(t)]
        return ruls
