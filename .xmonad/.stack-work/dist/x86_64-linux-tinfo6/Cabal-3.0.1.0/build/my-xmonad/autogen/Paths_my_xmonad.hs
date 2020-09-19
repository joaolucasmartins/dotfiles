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

bindir     = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/06456598a5175ac28089db36a2bac1ae7424c4540d25c581e309633b2b77710b/8.8.3/bin"
libdir     = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/06456598a5175ac28089db36a2bac1ae7424c4540d25c581e309633b2b77710b/8.8.3/lib/x86_64-linux-ghc-8.8.3/my-xmonad-0.1.0.0-Kvn84rhcWYLGtlsm2MdXkb-my-xmonad"
dynlibdir  = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/06456598a5175ac28089db36a2bac1ae7424c4540d25c581e309633b2b77710b/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/06456598a5175ac28089db36a2bac1ae7424c4540d25c581e309633b2b77710b/8.8.3/share/x86_64-linux-ghc-8.8.3/my-xmonad-0.1.0.0"
libexecdir = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/06456598a5175ac28089db36a2bac1ae7424c4540d25c581e309633b2b77710b/8.8.3/libexec/x86_64-linux-ghc-8.8.3/my-xmonad-0.1.0.0"
sysconfdir = "/home/jm/.xmonad/.stack-work/install/x86_64-linux-tinfo6/06456598a5175ac28089db36a2bac1ae7424c4540d25c581e309633b2b77710b/8.8.3/etc"

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
