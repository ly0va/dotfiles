from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default
from ranger.gui.color import bold


class Scheme(Default):

    def use(self, context):
        fg, bg, attr = Default.use(self, context)
        attr &= ~bold
        return fg, bg, attr
