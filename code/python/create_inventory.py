from jinja2 import Environment, FileSystemLoader
from utils import get_hosts
import os   

def main():

    dirname = os.path.dirname(__file__)
    TEMPLATE_OUTPUT = dirname + '/ansible/../inventory'
    env = Environment(loader=FileSystemLoader(dirname +'/templates'))
    temp = env.get_template('inventory.j2')
    nodes = []
    with open('public_ips','r') as fp:
        for line in fp:
            nodes.append(line.rstrip())

    print(temp.render(nodes=nodes))

if __name__ == '__main__':
	main()


