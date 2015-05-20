//
//  PlayerDetailsViewController.m
//  Tab bar example
//
//  Created by Julio Castillo on 5/14/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "Player.h"

@implementation PlayerDetailsViewController

NSString *_game;

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		NSLog(@"init PlayerDetailsViewController");
		_game = @"Chess";
	}
	return self;
}

- (IBAction)cancel:(id)sender {
	[self.delegate playerDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
	Player *player = [[Player alloc] init];
	player.name = self.nameTextField.text;
	player.game = _game;
	player.rating = 1;

	[self.delegate playerDetailsViewController:self didAddPlayer:player];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		[self.nameTextField becomeFirstResponder];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.detailLabel.text = _game;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"PickGame"]) {
		GamePickerViewController *gamePickerViewController = segue.destinationViewController;
		gamePickerViewController.delegate = self;
		gamePickerViewController.game = _game;
	}
}

- (void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)game {
	_game = game;
	self.detailLabel.text = _game;

	[self.navigationController popViewControllerAnimated:YES];
}

@end
