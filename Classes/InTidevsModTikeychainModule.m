/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "InTidevsModTikeychainModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "AppModule.h"

@implementation InTidevsModTikeychainModule

extern NSString * const TI_APPLICATION_ID;
#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"a2031fc0-1dc4-4b41-b9a6-0ff4f2c6e33b";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"in.tidevs.mod.tikeychain";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)addItem:(id)args {
    NSArray * arr = (NSArray *)args;
    NSString * key = [TiUtils stringValue:[arr objectAtIndex:0]];
    NSString * value = [TiUtils stringValue:[arr objectAtIndex:1]];
    [UICKeyChainStore setString:value forKey:key service:TI_APPLICATION_ID];
}

-(void)removeItem:(id)args {
    NSArray * arr = (NSArray *)args;
    NSString * key = [TiUtils stringValue:[arr objectAtIndex:0]];
    [UICKeyChainStore removeItemForKey:key service:TI_APPLICATION_ID];
}

-(NSString *)read:(id)args {
    NSArray * arr = (NSArray *)args;
    NSString * key = [TiUtils stringValue:[arr objectAtIndex:0]];
    return [UICKeyChainStore stringForKey: key service: TI_APPLICATION_ID];
}

@end
