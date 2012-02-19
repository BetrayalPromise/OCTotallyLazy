#import "None.h"
#import "NoSuchElementException.h"
#import "Some.h"
#import "LazySequence.h"
#import "EmptyEnumerator.h"

@implementation None
+ (Option *)none {
   return [[[None alloc] init] autorelease];
}

- (id <Enumerable>)flatten {
    return [[self asSequence] flatten];
}

- (id)get {
    [NoSuchElementException raise:@"Cannot get value of None" format:@"Cannot get value of None"];
    return nil;
}

- (id)getOrElse:(id)other {
    return other;
}

- (id)getOrInvoke:(id (^)())funcBlock {
    return funcBlock();
}

- (BOOL)isEqual:(id)otherObject {
    return [otherObject isKindOfClass:[None class]];
}

- (id)map:(id (^)(id))funcBlock {
    return [None none];
}

- (id)fold:(id)seed with:(id (^)(id, id))functorBlock {
    return [Some some:seed];
}

- (NSEnumerator *)toEnumerator {
    return [EmptyEnumerator emptyEnumerator];
}

- (LazySequence *)asSequence {
    return lazySequence(nil);
}

@end