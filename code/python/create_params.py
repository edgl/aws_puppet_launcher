from jinja2 import Environment, FileSystemLoader
from utils import get_hosts
import os   

def main():

    dirname = os.path.dirname(__file__) 
    if dirname == "":
        dirname = "."

    env = Environment(loader=FileSystemLoader(dirname + '/templates'))
    temp = env.get_template('common.yaml.j2')
    nodes = []
    with open(dirname + '/../hostfile','r') as fp:
        for line in fp:
            nodes.append(line.rstrip())

    print("")
    print("")
    print("#############################")
    print("")
    print("")

    print(temp.render(nodes=nodes))
    temp = env.get_template('site_pp.j2')


    print("")
    print("")
    print("#############################")
    print("")
    print("")

    print(temp.render(nodes=nodes))

    print("")
    print("")
    print("")

if __name__ == '__main__':
	main()


