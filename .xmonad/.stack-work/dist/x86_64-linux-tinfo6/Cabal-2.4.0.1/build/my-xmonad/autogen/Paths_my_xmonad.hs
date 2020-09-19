{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_my_xmonad (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/f75065d411b18f3025abb9fed725ee1ab66fd060ff26c7f233a84c4649a2151f/8.6.5/bin"
libdir     = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/f75065d411b18f3025abb9fed725ee1ab66fd060ff26c7f233a84c4649a2151f/8.6.5/lib/x86_64-linux-ghc-8.6.5/my-xmonad-0.1.0.0-FDnnpiU3a8oCTG18dUVKDx-my-xmonad"
dynlibdir  = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/f75065d411b18f3025abb9fed725ee1ab66fd060ff26c7f233a84c4649a2151f/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/f75065d411b18f3025abb9fed725ee1ab66fd060ff26c7f233a84c4649a2151f/8.6.5/share/x86_64-linux-ghc-8.6.5/my-xmonad-0.1.0.0"
libexecdir = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/f75065d411b18f3025abb9fed725ee1ab66fd060ff26c7f233a84c4649a2151f/8.6.5/libexec/x86_64-linux-ghc-8.6.5/my-xmonad-0.1.0.0"
sysconfdir = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/f75065d411b18f3025abb9fed725ee1ab66fd060ff26c7f233a84c4649a2151f/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "my_xmonad_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "my_xmonad_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "my_xmonad_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "my_xmonad_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_xmonad_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_xmonad_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
