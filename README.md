# iOS-Lock

## iOS-Lock
### 1. NSLock
[NSLock Apple Guide](https://developer.apple.com/documentation/foundation/nslock)

```
#import <Foundation/NSObject.h>

@class NSDate;

NS_ASSUME_NONNULL_BEGIN

@protocol NSLocking

- (void)lock;
- (void)unlock;

@end

@interface NSLock : NSObject <NSLocking> {
@private
void *_priv;
}

- (BOOL)tryLock;
- (BOOL)lockBeforeDate:(NSDate *)limit;

@property (nullable, copy) NSString *name API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));

@end
```

```
The NSLock class uses POSIX threads to implement its locking behavior. When sending an unlock message to an NSLock object, you must be sure that message is sent from the same thread that sent the initial lock message. Unlocking a lock from a different thread can result in undefined behavior.
```
- lock 和 unlock 需要在同一个线程试用，否则会出现未知错误

##NSCondition
##NSConditionLock
##NSRecursiveLock

##@synchronized
##dispatch_semaphore
##OSSpinLock
##pthread_mutex

