//
//  MessageItemViewController.m
//  ChatHere
//
//  Created by zhengna on 15/9/17.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "MessageItemViewController.h"
#import "MessageHeader.h"
#import "ContactPerson.h"

@interface MessageItemViewController ()

@property (nonatomic, strong) NSArray *messageHDs;
@property (nonatomic, strong) NSArray *persons;

@end

@implementation MessageItemViewController

//load message headers
- (NSArray *)messageHDs{

    
    if (!_messageHDs) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MessageHeaders.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *dict in array) {
            MessageHeader *msgHd = [MessageHeader msgHDWithDict:dict];
            [muArray addObject:msgHd];
        }
        _messageHDs = [muArray copy];
    }
    return _messageHDs;
}

//load contact person
- (NSArray *)persons{

    if (!_persons) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ContactPersons.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *dict in array) {
            ContactPerson *ctps = [ContactPerson contactPersonWithDict:dict];
            [muArray addObject:ctps];
        }
        _persons = [muArray copy];
    }
    return _persons;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 40;
    
    [self clipExtraCellLine:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.messageHDs.count;
}

#pragma mark - remove useless lines
- (void)clipExtraCellLine:(UITableView *)tableView{

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"messageHdCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    MessageHeader *msgHd = self.messageHDs[indexPath.row];
    ContactPerson *person = self.persons[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:person.icon];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = msgHd.lastMsg;

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
