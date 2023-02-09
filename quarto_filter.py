import sys
import nbformat
# read notebook from stdin
nb = nbformat.reads(sys.stdin.read(), as_version = 4)
# prepend a comment to the source of each cell
for index, cell in enumerate(nb.cells):
  if cell.cell_type == 'code':
     cell.source = cell.source.replace('#|export\n', '# this cell is exported to a script\n\n')
  
# write notebook to stdout 
nbformat.write(nb, sys.stdout)
