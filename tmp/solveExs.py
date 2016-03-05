path_src_examples = 'examples\\'
path_tmp_examples = '..\\tmp\\examples\\'

########## ########## ########## ########## ########## ########## ########## ##########

def extend(dir, name, ext):
    return dir + name + '.' + ext
    
########## ########## ########## ########## ########## ########## ########## ##########

def parse(name):
    cmd =   '.\\main ' + extend(path_src_examples, name, 'l') \
            + ' > ' + extend(path_tmp_examples, name, 'p')
    print(cmd)

########## ########## ########## ########## ########## ########## ########## ##########

def solve(name):
    cmd =   '.\\translator ' + extend(path_src_examples, name, 'l') + \
            ' | java -jar sparc.jar -solver clingo -A -loutput'
    print(cmd)
        
########## ########## ########## ########## ########## ########## ########## ##########

def translate(name):
    cmd =   '.\\translator ' + extend(path_src_examples, name, 'l') + \
            ' > ' + extend(path_tmp_examples, name, 'sp')
    print(cmd)

def output(name):
    cmd =   'java -jar sparc.jar -solver clingo -A -loutput ' + \
            extend(path_tmp_examples, name, 'sp') + ' > ' + \
            extend(path_tmp_examples, name, 'txt')
    print(cmd)
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

names = [   'card_constr', 'ch5', 'comment', 'free_vars', 
            'func_terms', 'graphs', 'pi1', 'pi2', 'pi3', 'ranking', 'sentence_head',
            'switchover', 't3', 'vu_test'] 
            
if __name__ == '__main__':
    print('\ncls')
    for name in names:
        # parse(name)
        # solve(name)
        translate(name)
        output(name)
