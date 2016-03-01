# -*- mode: python -*-

block_cipher = None

src = '../../git/LtoASPtranslator/src'
a = Analysis(['..\\..\\git\\LtoASPtranslator\\src\\translator.py'],
             pathex=['..\\..\\..\\OneDrive\\work'],
             binaries=None,
             datas=[(src+'/lexicon', ''), (src+'/grammar', '')],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=None,
             excludes=None,
             win_no_prefer_redirects=None,
             win_private_assemblies=None,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='translator',
          debug=False,
          strip=None,
          upx=True,
          console=True )
