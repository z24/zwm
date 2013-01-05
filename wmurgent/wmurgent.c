//------------------------------------------------------------------------------
#include <stdio.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
//------------------------------------------------------------------------------
int main(int argc,char *argv[])
{
    if (argc!=2)
    {
        fprintf(stderr,"Usage: %s WindowID\n",argv[0]);
        fprintf(stderr,"  WindowID: a hex number, e.x. 0x1\n");
        return 1;
    }

    Window wm;
    sscanf(argv[1],"%x",(unsigned int*)&wm);
    
    Display *dpy = XOpenDisplay(NULL);
    if (dpy==NULL)
        return 1;

    XWMHints *wmh = XGetWMHints(dpy,wm);
    if (wmh)
    {
        wmh->flags |= XUrgencyHint;
        XSetWMHints(dpy,wm,wmh);
        XFree(wmh);
    }

    XCloseDisplay(dpy);

    return 0;
}
//------------------------------------------------------------------------------
